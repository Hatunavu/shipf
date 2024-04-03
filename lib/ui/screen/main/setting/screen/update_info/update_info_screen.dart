// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/model/account/account_model.dart';
import 'package:shipf/enums/enum_noti_config.dart';
import 'package:shipf/enums/enum_role.dart';
import 'package:shipf/ui/app_cubit.dart';
import 'package:shipf/ui/screen/main/order/widget/order_label_text_filed_widget.dart';
import 'package:shipf/ui/screen/main/order/widget/select_address_widget.dart';
import 'package:shipf/ui/screen/main/setting/screen/update_info/cubit/update_info_cubit.dart';
import 'package:shipf/ui/screen/main/setting/screen/update_info/cubit/update_info_state.dart';
import 'package:shipf/ui/screen/main/setting/widget/select_zone_widget.dart';
import 'package:shipf/ui/screen/shipper/post/screen/create_post/widget/select_tonnage_widget.dart';
import 'package:shipf/ui/shared/base_screen.dart';
import 'package:shipf/ui/shared/textfield/primary_textfield.dart';
import 'package:shipf/ui/shared/utils/functions.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';
import 'package:shipf/ui/shared/widget/space/vertical_space.dart';
import 'package:shipf/ui/theme/constant.dart';

class UpdateInfoScreen extends StatelessWidget {
  final AccountData accountData;
  UpdateInfoScreen({super.key, required this.accountData});

  late UpdateInfoCubit updateInfoCubit;
  bool isLoading = false;

  final GlobalKey<FormState> updateInfoFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    RoleType? role = context.read<AppCubit>().state.role;
    return GestureDetector(
      onTap: () => unfocus(context),
      child: BlocProvider(
          create: (context) =>
              UpdateInfoCubit()..init(accountData, roleType: role!),
          child: BlocConsumer<UpdateInfoCubit, UpdateInfoState>(
              listener: (context, state) {},
              builder: (context, state) {
                updateInfoCubit = context.read<UpdateInfoCubit>();
                if (!state.isLoading) {
                  isLoading == true ? context.router.pop() : null;
                  isLoading = false;
                }
                if (state.isLoading) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    loadingShowDialog(context);
                    isLoading = true;
                  });
                }
                return BaseScreen(
                  title: 'Cập nhật thông tin',
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  child: state.isFirstLoad
                      ? const SizedBox()
                      : Form(
                          key: updateInfoFormKey,
                          child: Column(
                            children: [
                              Expanded(child: updateWidget(state, role!)),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: kDefaultPaddingWidthScreen,
                                    vertical: kDefaultPaddingHeightScreen),
                                child: PrimaryButton(
                                  label: 'Cập nhật',
                                  onPressed: () async {
                                    if (role == RoleType.shipper) {
                                      if (updateInfoFormKey.currentState!
                                              .validate() &&
                                          state.selectedZones.isNotEmpty &&
                                          state.selectedZonesDeliver
                                              .isNotEmpty) {
                                        await updateInfoCubit.updateInfo();
                                        context.router.pop();
                                      }
                                    } else {
                                      if (updateInfoFormKey.currentState!
                                          .validate()) {
                                        await updateInfoCubit.updateInfo();
                                        context.router.pop();
                                      }
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                );
              })),
    );
  }

  Widget updateWidget(UpdateInfoState state, RoleType role) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPaddingWidthWidget,
            vertical: kDefaultPaddingHeightScreen),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const OrderLabelTextFieldWidget(label: 'Họ và tên'),
            PrimaryTextField(
              controller: state.nameController!,
              label: '',
              maxLines: 1,
              hintText: 'Họ và tên',
              fieldRequire: 'Họ và tên',
            ),
            VerticalSpace(
              kDefaultPaddingHeightScreen,
            ),
            const OrderLabelTextFieldWidget(label: 'Số điện thoại'),
            PrimaryTextField(
              controller: state.phoneController!,
              label: '',
              maxLines: 1,
              hintText: 'Số điện thoại',
              fieldRequire: 'Số điện thoại',
              isPhone: true,
              showPrefixIcon: false,
            ),
            VerticalSpace(
              kDefaultPaddingHeightScreen,
            ),
            const OrderLabelTextFieldWidget(label: 'Email'),
            PrimaryTextField(
              controller: state.emailController!,
              label: '',
              maxLines: 1,
              hintText: 'Email',
              isEmail: true,
              showPrefixIcon: false,
              isRequire: false,
            ),
            VerticalSpace(
              kDefaultPaddingHeightScreen,
            ),
            const OrderLabelTextFieldWidget(label: 'Mật khẩu'),
            PrimaryTextField(
                controller: state.passwordController!,
                label: '',
                maxLines: 1,
                hintText: 'Mật khẩu',
                isPass: state.showPass,
                showPrefixIcon: false,
                showPass: () => updateInfoCubit.showPass()),
            role == RoleType.shipper
                ? Column(
                    children: [
                      VerticalSpace(
                        kDefaultPaddingHeightScreen,
                      ),
                      itemSelectZone(
                        label: 'Khu vực bốc hàng',
                      ),
                      VerticalSpace(
                        kDefaultPaddingHeightScreen,
                      ),
                      itemSelectZone(
                          label: 'Khu vực trả hàng', isDeliver: true),
                    ],
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  Widget itemSelectZone({
    required String label,
    bool isDeliver = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrderLabelTextFieldWidget(label: label),
        SelectZoneWidget(
          label: label,
          isDeliver: isDeliver,
          zones: isDeliver
              ? updateInfoCubit.state.zonesDelivery
              : updateInfoCubit.state.zones,
          validator: (_) {
            if (updateInfoCubit.state.selectedZones.isEmpty) {
              updateInfoCubit.updateZoneError();
            }
            if (updateInfoCubit.state.selectedZonesDeliver.isEmpty) {
              updateInfoCubit.updateZoneError(isDelivery: true);
            }
            return null;
          },
          errorZone: isDeliver
              ? updateInfoCubit.state.errorZoneDeliver
              : updateInfoCubit.state.errorZone,
          multiZone: (zones) {
            updateInfoCubit.updateZone(zones, isDelivery: isDeliver);
          },
          multiZones: isDeliver
              ? updateInfoCubit.state.selectedZonesDeliver
              : updateInfoCubit.state.selectedZones,
        ),
      ],
    );
  }

  Widget updateLater(UpdateInfoState state) {
    return Column(
      children: [
        itemSelectLocation(
          label: 'Tỉnh/Thành phố bốc hàng',
        ),
        VerticalSpace(
          kDefaultPaddingHeightScreen,
        ),
        itemSelectLocation(label: 'Tỉnh/Thành phố trả hàng', isDeliver: true),
        VerticalSpace(
          kDefaultPaddingHeightScreen,
        ),
        const OrderLabelTextFieldWidget(label: 'Loại xe'),
        SelectTonnageWidget(
          tonnage: state.tonnage,
          selectTonnage: (tonnage) {
            updateInfoCubit.updateTonnage(tonnage);
          },
        ),
        VerticalSpace(
          kDefaultPaddingHeightScreen,
        ),
        const OrderLabelTextFieldWidget(label: 'Cài đặt thông báo'),
        Container(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPaddingWidthWidget),
          decoration: BoxDecoration(
              color: backgroundTextField,
              borderRadius: BorderRadius.circular(secondaryBorderRadius)),
          child: DropdownButton(
            dropdownColor: Colors.white,
            underline: const SizedBox(),
            isExpanded: true,
            value: state.notiConfig,
            items: [
              NotiConfig.allNotification,
              NotiConfig.onlyActiveZone,
              NotiConfig.noNotification
            ].map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(
                  value.display(),
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }).toList(),
            onChanged: (NotiConfig? value) {
              updateInfoCubit.updateNotiConfig(value);
            },
            elevation: 1,
          ),
        ),
      ],
    );
  }

  Widget itemSelectLocation({
    required String label,
    bool isDeliver = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrderLabelTextFieldWidget(label: label),
        SelectAddressWidget(
          isMultiSelect: true,
          selectDistrict: (index) {},
          selectWard: (index) {},
          label: label,
          isDeliver: isDeliver,
          provinces: updateInfoCubit.state.provinces,
          selectProvince: (index) {},
          multiProvince: (provinces) {
            updateInfoCubit.updateProvince(provinces, isDelivery: isDeliver);
          },
          multiProvinces: isDeliver
              ? updateInfoCubit.state.selectedProvincesDeliver
              : updateInfoCubit.state.selectedProvinces,
        ),
      ],
    );
  }
}
