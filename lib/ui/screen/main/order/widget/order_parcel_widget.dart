import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shipf/ui/shared/textfield/primary_textfield.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';
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
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPaddingWidthWidget,
            vertical: kDefaultPaddingHeightScreen),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Thông tin hàng hoá',
            style: textHeading,
          ),
          SizedBox(
            height: kDefaultPaddingHeightScreen / 2,
          ),
          Column(
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
          SizedBox(
            height: kDefaultPaddingHeightScreen / 2,
          ),
          Column(
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
          SizedBox(
            height: kDefaultPaddingHeightScreen / 2,
          ),
          Row(
            children: [
              Expanded(
                  child:
                      parcelAmountWidget(controller: _parcelAmountController)),
              SizedBox(
                width: kDefaultPaddingWidthWidget / 2,
              ),
              Expanded(
                child: parcelAmountWidget(
                    controller: _parcelWeightController, isAmount: false),
              ),
            ],
          ),
          SizedBox(
            height: kDefaultPaddingHeightScreen / 2,
          ),
        ]),
      ),
      Divider(
        thickness: kDefaultPaddingHeightScreen,
        color: backgroundColor,
      ),
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPaddingWidthWidget,
            vertical: kDefaultPaddingHeightScreen),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kích thước hàng hoá (cm)',
              style: textHeading,
            ),
            SizedBox(
              height: kDefaultPaddingHeightScreen / 2,
            ),
            parcelSize(),
            SizedBox(
              height: kDefaultPaddingHeightScreen / 2,
            ),
          ],
        ),
      ),
      Divider(
        thickness: kDefaultPaddingHeightScreen,
        color: backgroundColor,
      ),
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPaddingWidthWidget,
            vertical: kDefaultPaddingHeightScreen),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bốc xếp hàng hoá',
              style: textHeading,
            ),
            SizedBox(
              height: kDefaultPaddingHeightWidget,
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPaddingWidthWidget),
                        child: SizedBox(
                          width: kDefaultPaddingWidthWidget,
                          height: kDefaultPaddingWidthWidget,
                          child: Checkbox(
                            activeColor: primaryColor,
                            value: false,
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                      Text('Đầu lấy')
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPaddingWidthWidget),
                        child: SizedBox(
                          width: kDefaultPaddingWidthWidget,
                          height: kDefaultPaddingWidthWidget,
                          child: Checkbox(
                            activeColor: primaryColor,
                            value: false,
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                      Text('Đầu giao')
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: kDefaultPaddingHeightScreen / 2,
            ),
          ],
        ),
      ),
      Divider(
        thickness: kDefaultPaddingHeightScreen,
        color: backgroundColor,
      ),
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPaddingWidthWidget,
            vertical: kDefaultPaddingHeightScreen),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Thông tin thanh toán',
              style: textHeading,
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
              height: kDefaultPaddingHeightWidget,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPaddingWidthWidget),
                  child: SizedBox(
                    width: kDefaultPaddingWidthWidget,
                    height: kDefaultPaddingWidthWidget,
                    child: Checkbox(
                      activeColor: primaryColor,
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                ),
                Text('Bảo hiểm hàng hoá')
              ],
            ),
            SizedBox(
              height: kDefaultPaddingHeightScreen,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                labelTextField('Ghi chú'),
                PrimaryTextField(
                  label: '',
                  controller: _noteController,
                  maxLines: 3,
                ),
              ],
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.all(kDefaultPaddingWidthWidget),
        child: PrimaryButton(
          label: 'Tiếp tục',
          onPressed: () {
            // orderCubit.updateStepOrder(StepOrderType.parcel);
          },
        ),
      )
    ]);
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
              changeAmountButton(controller, isIncrease: false),
              Expanded(
                  child:
                      inputNumber(controller, lengthLimit: isAmount ? 2 : 7)),
              changeAmountButton(controller),
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

  Widget parcelSize() {
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                labelTextField('Chiều dài'),
                PrimaryTextField(
                  label: '',
                  controller: _codController,
                  hintText: '0',
                  isPrice: true,
                  isNumberKey: true,
                ),
              ],
            ),
          ),
          SizedBox(
            width: kDefaultPaddingWidthWidget / 2,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                labelTextField('Chiều rộng'),
                PrimaryTextField(
                  label: '',
                  controller: _codController,
                  hintText: '0',
                  isPrice: true,
                  isNumberKey: true,
                ),
              ],
            ),
          ),
          SizedBox(
            width: kDefaultPaddingWidthWidget / 2,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                labelTextField('Chiều cao'),
                PrimaryTextField(
                  label: '',
                  controller: _codController,
                  hintText: '0',
                  isPrice: true,
                  isNumberKey: true,
                ),
              ],
            ),
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
}
