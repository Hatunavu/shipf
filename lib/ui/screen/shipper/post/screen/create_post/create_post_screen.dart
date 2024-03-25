import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shipf/data/model/post/post_response.dart';
import 'package:shipf/enums/enum_post_status.dart';
import 'package:shipf/ui/screen/main/order/widget/order_label_text_filed_widget.dart';
import 'package:shipf/ui/screen/main/order/widget/select_address_widget.dart';
import 'package:shipf/ui/screen/shipper/post/screen/create_post/cubit/create_post_cubit.dart';
import 'package:shipf/ui/screen/shipper/post/screen/create_post/cubit/create_post_state.dart';
import 'package:shipf/ui/screen/shipper/post/screen/create_post/widget/select_tonnage_widget.dart';
import 'package:shipf/ui/screen/shipper/post/screen/create_post/widget/select_unit_widget.dart';
import 'package:shipf/ui/services/account_services.dart';
import 'package:shipf/ui/shared/base_screen.dart';
import 'package:shipf/ui/shared/textfield/primary_textfield.dart';
import 'package:shipf/ui/shared/utils/functions.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';
import 'package:shipf/ui/shared/widget/space/vertical_space.dart';
import 'package:shipf/ui/theme/constant.dart';

class CreatePostScreen extends StatefulWidget {
  final PostData? postData;
  final Function()? callBack;

  const CreatePostScreen({Key? key, this.postData, this.callBack})
      : super(key: key);

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final GlobalKey<FormState> createPostFormKey = GlobalKey<FormState>();
  late CreatePostCubit createPostCubit;
  late int currentValue;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        unfocus(context);
      },
      child: BlocProvider(
        create: (context) => CreatePostCubit()..init(postData: widget.postData),
        child: BlocConsumer<CreatePostCubit, CreatePostState>(
          listener: (context, state) {},
          builder: (context, state) {
            createPostCubit = context.read<CreatePostCubit>();
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
                title: 'Đăng đơn tìm xe',
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
                        key: createPostFormKey,
                        child: Column(
                          children: [
                            Expanded(
                                child: SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: kDefaultPaddingWidthWidget,
                                    vertical: kDefaultPaddingHeightScreen),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const OrderLabelTextFieldWidget(
                                        label: 'Số điện thoại'),
                                    PrimaryTextField(
                                      label: '',
                                      controller: state.phoneController!,
                                      hintText: '',
                                      isPhone: true,
                                      showPrefixIcon: false,
                                    ),
                                    VerticalSpace(
                                      kDefaultPaddingHeightScreen,
                                    ),
                                    const OrderLabelTextFieldWidget(
                                        label: 'Mô tả chi tiết nhu cầu tìm xe'),
                                    PrimaryTextField(
                                      label: '',
                                      controller: state.contentController!,
                                      hintText: '',
                                      fieldRequire: 'mô tả',
                                    ),
                                    VerticalSpace(
                                      kDefaultPaddingHeightScreen,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: parcelAmountWidget(
                                                controller:
                                                    state.amountController!)),
                                        SizedBox(
                                          width: kDefaultPaddingWidthWidget / 2,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const OrderLabelTextFieldWidget(
                                                  label: 'Đơn vị'),
                                              SelectUnitWidget(
                                                unit: state.unit,
                                                selectUnit: (unit) {
                                                  createPostCubit
                                                      .updateUnit(unit);
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    VerticalSpace(
                                      kDefaultPaddingHeightScreen,
                                    ),
                                    itemSelectLocation(
                                      label: 'Tỉnh/Thành phố bốc hàng',
                                    ),
                                    VerticalSpace(
                                      kDefaultPaddingHeightScreen,
                                    ),
                                    itemSelectLocation(
                                        label: 'Tỉnh/Thành phố trả hàng',
                                        isDeliver: true),
                                    VerticalSpace(
                                      kDefaultPaddingHeightScreen,
                                    ),
                                    const OrderLabelTextFieldWidget(
                                        label: 'Loại xe'),
                                    SelectTonnageWidget(
                                      tonnage: state.tonnage,
                                      selectTonnage: (tonnage) {
                                        createPostCubit.updateTonnage(tonnage);
                                      },
                                      errorText:
                                          createPostCubit.state.errorTonnage,
                                      validator: (_) {
                                        if (createPostCubit.state.tonnage ==
                                            null) {
                                          createPostCubit.updateTonnageError();
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            )),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: kDefaultPaddingWidthScreen,
                                  vertical: kDefaultPaddingHeightScreen),
                              child: Column(
                                children: [
                                  PrimaryButton.outline(
                                    label: 'Lưu nháp',
                                    onPressed: () async {
                                      if (createPostFormKey.currentState!
                                              .validate() &&
                                          state.selectedProvinces.isNotEmpty &&
                                          state.selectedProvincesDeliver
                                              .isNotEmpty) {
                                        widget.postData != null
                                            ? await createPostCubit.updatePost(
                                                id: widget.postData!.id,
                                                status: PostStatusType.draft)
                                            : await createPostCubit.createPost(
                                                status: PostStatusType.draft);
                                        context.router.pop();
                                        widget.callBack!.call();
                                      }
                                    },
                                  ),
                                  VerticalSpace(kDefaultPaddingHeightScreen),
                                  PrimaryButton(
                                    label: 'Đăng đơn',
                                    onPressed: () async {
                                      if (createPostFormKey.currentState!
                                              .validate() &&
                                          state.selectedProvinces.isNotEmpty &&
                                          state.selectedProvincesDeliver
                                              .isNotEmpty &&
                                          state.tonnage != null) {
                                        final username = await AccountServices()
                                            .getUsername();
                                        widget.postData != null
                                            ? await createPostCubit.updatePost(
                                                id: widget.postData!.id,
                                              )
                                            : await createPostCubit
                                                .createPost();
                                        context.router.pop();
                                        widget.callBack!.call();
                                      }
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ));
          },
        ),
      ),
    );
  }

  Widget parcelAmountWidget({required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const OrderLabelTextFieldWidget(label: 'Số lượng'),
        SizedBox(
          child: Row(
            children: [
              changeAmountButton(controller, isIncrease: false),
              Expanded(child: inputNumber(controller, lengthLimit: 7)),
              changeAmountButton(controller),
            ],
          ),
        )
      ],
    );
  }

  Widget changeAmountButton(TextEditingController controller,
      {bool isIncrease = true}) {
    bool isActive = (isIncrease && controller.text != '999,999') ||
        (!isIncrease && controller.text != '1');
    return GestureDetector(
      onTap: isActive
          ? () {
              unfocus(context);
              currentValue = int.parse(controller.text.replaceAll(',', ''));
              setState(() {
                isIncrease ? currentValue++ : currentValue--;
                controller.text = NumberFormat.decimalPattern()
                    .format(currentValue)
                    .toString();
              });
            }
          : null,
      child: Container(
        margin: EdgeInsets.only(
            left: isIncrease ? 5.w : 0, right: isIncrease ? 0 : 5.w),
        height: 30.h,
        width: 30.h,
        decoration: BoxDecoration(
            border: Border.all(color: isActive ? primaryColor : greyText),
            borderRadius: BorderRadius.circular(5.r)),
        child: Icon(
          isIncrease ? Icons.add : Icons.remove,
          color: isActive ? primaryColor : greyText,
        ),
      ),
    );
  }

  Widget inputNumber(TextEditingController controller, {int lengthLimit = 2}) {
    return TextFormField(
      controller: controller,
      onChanged: (string) {
        string = NumberFormat.decimalPattern().format(int.parse(
            string.replaceAll(',', '').isEmpty
                ? '1'
                : string.replaceAll(',', '')));
        controller.value = TextEditingValue(
          text: string,
          selection: TextSelection.collapsed(offset: string.length),
        );
      },
      inputFormatters: <TextInputFormatter>[
        LengthLimitingTextInputFormatter(lengthLimit),
        FilteringTextInputFormatter.allow(RegExp("[0-9]")),
      ],
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        filled: true,
        fillColor: backgroundTextField,
        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(defaultBorderRadius)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(defaultBorderRadius)),
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
          provinces: createPostCubit.state.provinces,
          errorProvince: isDeliver
              ? createPostCubit.state.errorProvinceDeliver
              : createPostCubit.state.errorProvince,
          selectProvince: (index) {},
          validator: (_) {
            if (createPostCubit.state.selectedProvinces.isEmpty) {
              createPostCubit.updateProvinceError(isDelivery: isDeliver);
            }
            return null;
          },
          multiProvince: (provinces) {
            createPostCubit.updateProvince(provinces, isDelivery: isDeliver);
          },
          multiProvinces: isDeliver
              ? createPostCubit.state.selectedProvincesDeliver
              : createPostCubit.state.selectedProvinces,
        ),
      ],
    );
  }
}
