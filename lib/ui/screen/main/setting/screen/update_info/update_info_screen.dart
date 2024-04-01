import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/enums/enum_noti_config.dart';
import 'package:shipf/enums/enum_role.dart';
import 'package:shipf/ui/app_cubit.dart';
import 'package:shipf/ui/screen/main/order/widget/order_label_text_filed_widget.dart';
import 'package:shipf/ui/screen/main/order/widget/select_address_widget.dart';
import 'package:shipf/ui/screen/main/setting/screen/update_info/cubit/update_info_cubit.dart';
import 'package:shipf/ui/screen/main/setting/screen/update_info/cubit/update_info_state.dart';
import 'package:shipf/ui/screen/shipper/post/screen/create_post/widget/select_tonnage_widget.dart';
import 'package:shipf/ui/shared/base_screen.dart';
import 'package:shipf/ui/shared/utils/functions.dart';
import 'package:shipf/ui/shared/widget/space/vertical_space.dart';
import 'package:shipf/ui/theme/constant.dart';

class UpdateInfoScreen extends StatelessWidget {
  UpdateInfoScreen({super.key});

  late UpdateInfoCubit updateInfoCubit;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    RoleType? role = context.read<AppCubit>().state.role;
    return BlocProvider(
        create: (context) => UpdateInfoCubit(),
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
                child: role == RoleType.shipper
                    ? updateShipper(state)
                    : const Center(
                        child: Text("Tính năng đang được phát triển")),
              );
            }));
  }

  Widget updateShipper(UpdateInfoState state) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPaddingWidthWidget,
          vertical: kDefaultPaddingHeightScreen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            padding:
                EdgeInsets.symmetric(horizontal: kDefaultPaddingWidthWidget),
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
      ),
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
