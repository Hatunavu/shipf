import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/ui/shared/textfield/primary_textfield.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class OrderParcelWidget extends StatefulWidget {
  OrderParcelWidget({super.key});

  @override
  State<OrderParcelWidget> createState() => _OrderParcelWidgetState();
}

class _OrderParcelWidgetState extends State<OrderParcelWidget> {
  final TextEditingController _homeController = TextEditingController();

  final TextEditingController _parcelAmountController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _parcelAmountController.text = '1';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPaddingWidthWidget,
          vertical: kDefaultPaddingHeightScreen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Thông tin hàng hoá',
            style: textHeading,
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
                    labelTextField('Tên hàng hoá'),
                    PrimaryTextField(
                      label: '',
                      controller: _homeController,
                      hintText: 'Ví dụ: Iphone 15 Pro Max',
                    ),
                  ],
                ),
              ),
              parcelAmountWidget()
            ],
          ),
        ],
      ),
    );
  }

  Widget parcelAmountWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelTextField('Số lượng'),
        SizedBox(
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  int currentValue = int.parse(_parcelAmountController.text);
                  setState(() {
                    currentValue++;
                    _parcelAmountController.text =
                        (currentValue).toString(); // incrementing value
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 5.w),
                  height: 30.h,
                  width: 30.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: primaryColor),
                      borderRadius: BorderRadius.circular(5.r)),
                  child: const Icon(
                    Icons.add,
                    color: primaryColor,
                  ),
                ),
              ),
              SizedBox(
                width: 40.h,
                child: TextFormField(
                  controller: _parcelAmountController,
                  inputFormatters: <TextInputFormatter>[
                    LengthLimitingTextInputFormatter(2),
                  ],
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: backgroundTextField,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius)),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 5.w),
                height: 30.h,
                width: 30.h,
                decoration: BoxDecoration(
                    border: Border.all(color: primaryColor),
                    borderRadius: BorderRadius.circular(5.r)),
                child: const Icon(
                  Icons.remove,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        )
      ],
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
}
