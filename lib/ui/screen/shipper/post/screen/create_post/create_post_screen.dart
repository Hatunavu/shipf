import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shipf/data/model/address/address.dart';
import 'package:shipf/ui/screen/main/order/widget/order_label_text_filed_widget.dart';
import 'package:shipf/ui/screen/main/order/widget/select_address_widget.dart';
import 'package:shipf/ui/screen/shipper/post/screen/create_post/create_post_cubit.dart';
import 'package:shipf/ui/screen/shipper/post/screen/create_post/create_post_state.dart';
import 'package:shipf/ui/shared/base_screen.dart';
import 'package:shipf/ui/shared/textfield/primary_textfield.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';
import 'package:shipf/ui/shared/widget/space/vertical_space.dart';
import 'package:shipf/ui/shared/widget/toast_util.dart';
import 'package:shipf/ui/theme/constant.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  TextEditingController controller = TextEditingController();
  late CreatePostCubit createPostCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreatePostCubit()..getProvinces(),
      child: BlocConsumer<CreatePostCubit, CreatePostState>(
        listener: (context, state) {},
        builder: (context, state) {
          createPostCubit = context.read<CreatePostCubit>();
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
              child: Column(
                children: [
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPaddingWidthWidget,
                        vertical: kDefaultPaddingHeightScreen),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const OrderLabelTextFieldWidget(label: 'Số điện thoại'),
                        PrimaryTextField(
                          label: '',
                          controller: controller,
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
                          controller: controller,
                          hintText: '',
                          isPhone: true,
                          showPrefixIcon: false,
                        ),
                        VerticalSpace(
                          kDefaultPaddingHeightScreen,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child:
                                    parcelAmountWidget(controller: controller)),
                            SizedBox(
                              width: kDefaultPaddingWidthWidget / 2,
                            ),
                            Expanded(
                              child: parcelAmountWidget(controller: controller),
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
                            label: 'Tỉnh/Thành phố trả hàng', isDeliver: true),
                      ],
                    ),
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPaddingWidget),
                    child: PrimaryButton(
                      label: 'Đăng đơn',
                      onPressed: () {
                        ToastUtils.showNeutral(
                            'Tính năng đăng được phát triển');
                      },
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }

  Widget parcelAmountWidget({required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrderLabelTextFieldWidget(label: 'Số lượng'),
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
      // onTap: isActive
      //     ? () {
      //         currentValue = int.parse(controller.text.replaceAll(',', ''));
      //         setState(() {
      //           isIncrease ? currentValue++ : currentValue--;
      //           controller.text = NumberFormat.decimalPattern()
      //               .format(currentValue)
      //               .toString();
      //         });
      //       }
      //     : null,
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
    AddressSavedData? addressData,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrderLabelTextFieldWidget(label: label),
        SelectAddressWidget(
          selectDistrict: (index) {},
          selectWard: (index) {},
          label: label,
          isDeliver: isDeliver,
          provinces: createPostCubit.state.provinces,
          province: isDeliver
              ? createPostCubit.state.provinceDeliver
              : createPostCubit.state.province,
          errorProvince: createPostCubit.state.errorProvince,
          selectProvince: (index) {
            createPostCubit.updateProvince(
                createPostCubit.state.provinces[index],
                isDelivery: isDeliver);
          },
          validator: (_) {
            if (createPostCubit.state.province == null) {
              createPostCubit.updateProvinceError(isDelivery: isDeliver);
            }
            return null;
          },
        ),
      ],
    );
  }
}
