import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/enums/enum_step_order.dart';
import 'package:shipf/ui/screen/main/add_address/widget/select_address_widget.dart';
import 'package:shipf/ui/screen/main/order/cubit/order_cubit.dart';
import 'package:shipf/ui/shared/textfield/primary_textfield.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class OrderAddressWidget extends StatelessWidget {
  OrderCubit orderCubit;
  OrderAddressWidget({super.key, required this.orderCubit});
  final TextEditingController _homeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        address('Nơi gửi'),
        Divider(
          thickness: kDefaultPaddingHeightScreen,
          color: backgroundColor,
        ),
        address('Nơi nhận'),
        Padding(
          padding: EdgeInsets.all(kDefaultPaddingWidthWidget),
          child: PrimaryButton(
            label: 'Tiếp tục',
            onPressed: () {
              orderCubit.updateStepOrder(StepOrderType.goods);
            },
          ),
        )
      ],
    );
  }

  Widget address(String type) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPaddingWidthWidget,
          vertical: kDefaultPaddingHeightScreen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            type,
            style: textHeading,
          ),
          SizedBox(
            height: kDefaultPaddingHeightScreen / 2,
          ),
          labelTextField('Họ và Tên'),
          PrimaryTextField(
            label: '',
            controller: _homeController,
            hintText: 'Ví dụ: Nguyễn Văn A',
          ),
          SizedBox(
            height: kDefaultPaddingHeightScreen / 2,
          ),
          labelTextField('Số điện thoại'),
          PrimaryTextField(
            label: '',
            controller: _homeController,
            hintText: 'Ví dụ: 098xxxxxxx',
          ),
          SizedBox(
            height: kDefaultPaddingHeightScreen / 2,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    labelTextField('Địa chỉ'),
                    PrimaryTextField(
                      label: '',
                      controller: _homeController,
                      hintText: 'Ví dụ: 123 đường Chiến Thắng,...',
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: kDefaultPaddingWidthScreen / 2,
              ),
              Expanded(child: itemSelectLocation(label: 'Tỉnh/Thành phố')),
            ],
          ),
          SizedBox(
            height: kDefaultPaddingHeightScreen / 2,
          ),
          Row(
            children: [
              Expanded(
                  child: itemSelectLocation(
                      label: 'Quận/Huyện', isDistrict: true)),
              SizedBox(
                width: kDefaultPaddingWidthScreen / 2,
              ),
              Expanded(
                  child: itemSelectLocation(
                      label: 'Phường/Xã/Thị trấn', isWard: true)),
            ],
          ),
        ],
      ),
    );
  }

  Widget labelTextField(String label) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPaddingWidthWidget, vertical: 5.h),
      child: Text(
        label,
        style: primarySubTitleStyle,
      ),
    );
  }

  Widget itemSelectLocation(
      {bool isDistrict = false, bool isWard = false, required String label}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelTextField(label),
        SelectAddressWidget(
          label: label,
          isDistrict: isDistrict,
          isWard: isWard,
        ),
      ],
    );
  }
}
