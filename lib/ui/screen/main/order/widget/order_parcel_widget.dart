import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
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
  final TextEditingController _priceController = TextEditingController();

  final TextEditingController _parcelAmountController = TextEditingController();
  final TextEditingController _parcelWeightController = TextEditingController();
  final TextEditingController _codController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  late int currentValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _parcelAmountController.text = '1';
    _parcelWeightController.text = '1';
    currentValue = 0;
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
              SizedBox(
                width: kDefaultPaddingWidthWidget / 2,
              ),
              parcelAmountWidget(controller: _parcelAmountController)
            ],
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
                    labelTextField('Giá trị(đ)'),
                    PrimaryTextField(
                        isPrice: true,
                        isNumberKey: true,
                        label: '',
                        controller: _priceController,
                        hintText: '0',
                        maxLines: 1,
                        lengthLimit: 18),
                  ],
                ),
              ),
              SizedBox(
                width: kDefaultPaddingWidthWidget / 2,
              ),
              Expanded(
                child: parcelAmountWidget(
                    controller: _parcelWeightController, isAmount: false),
              )
            ],
          ),
          SizedBox(
            height: kDefaultPaddingHeightScreen / 2,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              labelTextField('COD(đ)'),
              PrimaryTextField(
                label: '',
                controller: _codController,
                hintText: '0',
                isPrice: true,
                isNumberKey: true,
              ),
            ],
          ),
          SizedBox(
            height: kDefaultPaddingHeightScreen / 2,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              labelTextField('Ghi chú'),
              PrimaryTextField(
                label: '',
                controller: _noteController,
                maxLines: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget parcelAmountWidget(
      {required TextEditingController controller, bool isAmount = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelTextField(isAmount ? 'Số lượng' : 'Khối lượng(g)'),
        SizedBox(
          child: Row(
            children: [
              changeAmountButton(controller),
              isAmount
                  ? SizedBox(
                      width: 40.h,
                      child: inputNumber(controller),
                    )
                  : Expanded(child: inputNumber(controller, lengthLimit: 7)),
              changeAmountButton(controller, isIncrease: false),
            ],
          ),
        )
      ],
    );
  }

  Widget inputNumber(TextEditingController controller, {int lengthLimit = 2}) {
    String _formatNumber(String s) =>
        NumberFormat.decimalPattern().format(int.parse(s.isEmpty ? '1' : s));
    return TextFormField(
      controller: controller,
      onChanged: (string) {
        string = _formatNumber(string.replaceAll(',', ''));
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

  Widget changeAmountButton(TextEditingController controller,
      {bool isIncrease = true}) {
    bool isActive = (isIncrease && controller.text != '999,999') ||
        (!isIncrease && controller.text != '1');
    return GestureDetector(
      onTap: isActive
          ? () {
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
            right: isIncrease ? 5.w : 0, left: isIncrease ? 0 : 5.w),
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
