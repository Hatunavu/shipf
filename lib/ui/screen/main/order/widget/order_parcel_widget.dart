// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shipf/enums/enum_step_order.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/screen/main/order/cubit/order_cubit.dart';
import 'package:shipf/ui/screen/main/order/widget/order_label_text_filed_widget.dart';
import 'package:shipf/ui/shared/textfield/primary_textfield.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';
import 'package:shipf/ui/shared/widget/space/horizontal_space.dart';
import 'package:shipf/ui/shared/widget/space/vertical_space.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class OrderParcelWidget extends StatefulWidget {
  OrderCubit orderCubit;

  GlobalKey<FormState> parcelformKey;

  OrderParcelWidget(
      {super.key, required this.orderCubit, required this.parcelformKey});

  @override
  State<OrderParcelWidget> createState() => _OrderParcelWidgetState();
}

class _OrderParcelWidgetState extends State<OrderParcelWidget> {
  late int currentValue;

  @override
  void initState() {
    super.initState();
    currentValue = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        parcelInfo(),
        VerticalSpace(
          kDefaultPaddingHeightScreen,
          color: backgroundColor,
        ),
        parcelSize(),
        VerticalSpace(
          kDefaultPaddingHeightScreen,
          color: backgroundColor,
        ),
        parcelLoading(),
        VerticalSpace(
          kDefaultPaddingHeightScreen,
          color: backgroundColor,
        ),
        paymentInfo(),
        Padding(
          padding: EdgeInsets.all(kDefaultPaddingWidthWidget),
          child: PrimaryButton(
            label: text.continuee,
            onPressed: () async {
              if (widget.parcelformKey.currentState!.validate()) {
                final success = await widget.orderCubit.getService();
                success
                    ? widget.orderCubit.updateStepOrder(StepOrderType.fee)
                    : null;
              }
            },
          ),
        )
      ]),
    );
  }

  Widget parcelInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPaddingWidthWidget,
          vertical: kDefaultPaddingHeightScreen),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          text.parcel_info,
          style: textHeading,
        ),
        VerticalSpace(
          kDefaultPaddingHeightScreen,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderLabelTextFieldWidget(label: text.parcel_name),
            PrimaryTextField(
              label: '',
              controller: widget.orderCubit.state.parcelNameController!,
              hintText: text.parcel_name,
              fieldRequire: text.parcel_name,
            ),
          ],
        ),
        VerticalSpace(
          kDefaultPaddingHeightScreen,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderLabelTextFieldWidget(label: '${text.value} (đ)'),
            PrimaryTextField(
              isPrice: true,
              isNumberKey: true,
              label: '',
              controller: widget.orderCubit.state.parcelPriceController!,
              hintText: '0',
              maxLines: 1,
              lengthLimit: 18,
              isValidate: false,
            ),
          ],
        ),
        VerticalSpace(
          kDefaultPaddingHeightScreen,
        ),
        Row(
          children: [
            Expanded(
                child: parcelAmountWidget(
                    controller:
                        widget.orderCubit.state.parcelAmountController!)),
            SizedBox(
              width: kDefaultPaddingWidthWidget / 2,
            ),
            Expanded(
              child: parcelAmountWidget(
                  controller: widget.orderCubit.state.parcelWeightController!,
                  isAmount: false),
            ),
          ],
        ),
      ]),
    );
  }

  Widget parcelSize() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPaddingWidthWidget,
          vertical: kDefaultPaddingHeightScreen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${text.parcel_size} (cm)',
            style: textHeading,
          ),
          VerticalSpace(
            kDefaultPaddingHeightScreen,
          ),
          SizedBox(
            child: Row(
              children: [
                parcelSizeItem(
                    label: text.length,
                    controller: widget.orderCubit.state.lengthController!),
                HorizontalSpace(
                  kDefaultPaddingWidthWidget / 2,
                ),
                parcelSizeItem(
                    label: text.width,
                    controller: widget.orderCubit.state.widthController!),
                HorizontalSpace(
                  kDefaultPaddingWidthWidget / 2,
                ),
                parcelSizeItem(
                    label: text.height,
                    controller: widget.orderCubit.state.heightController!)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget parcelLoading() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPaddingWidthWidget,
          vertical: kDefaultPaddingHeightScreen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text.parcel_loading,
            style: textHeading,
          ),
          VerticalSpace(
            kDefaultPaddingHeightWidget,
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => widget.orderCubit.updateLoadingType(),
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
                            value: widget.orderCubit.state.pickupPoint,
                            onChanged: (value) =>
                                widget.orderCubit..updateLoadingType(),
                          ),
                        ),
                      ),
                      Text(text.pickup_point)
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () =>
                      widget.orderCubit.updateLoadingType(isPickup: false),
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
                            value: widget.orderCubit.state.deliveryPoint,
                            onChanged: (value) => widget.orderCubit
                                .updateLoadingType(isPickup: false),
                          ),
                        ),
                      ),
                      Text(text.delivery_point)
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: kDefaultPaddingHeightScreen / 2,
          ),
        ],
      ),
    );
  }

  Widget paymentInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPaddingWidthWidget,
          vertical: kDefaultPaddingHeightScreen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text.payment_info,
            style: textHeading,
          ),
          VerticalSpace(
            kDefaultPaddingHeightScreen,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrderLabelTextFieldWidget(label: '${text.cod} (đ)'),
              PrimaryTextField(
                label: '',
                controller: widget.orderCubit.state.codController!,
                hintText: '0',
                isPrice: true,
                isNumberKey: true,
                isValidate: false,
              ),
            ],
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => widget.orderCubit.updateInsurance(),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(vertical: kDefaultPaddingHeightWidget),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPaddingWidthWidget),
                    child: SizedBox(
                      width: kDefaultPaddingWidthWidget,
                      height: kDefaultPaddingWidthWidget,
                      child: Checkbox(
                        activeColor: primaryColor,
                        value: widget.orderCubit.state.insurance,
                        onChanged: (value) =>
                            widget.orderCubit.updateInsurance(),
                      ),
                    ),
                  ),
                  Text(text.insurance)
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrderLabelTextFieldWidget(label: text.note),
              PrimaryTextField(
                label: '',
                controller: widget.orderCubit.state.noteController!,
                maxLines: 3,
                isValidate: false,
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
        OrderLabelTextFieldWidget(
            label: isAmount ? text.quantity : '${text.weight} (kg)'),
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

  Widget parcelSizeItem(
      {required String label, required TextEditingController controller}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderLabelTextFieldWidget(label: label),
          PrimaryTextField(
            label: '',
            controller: controller,
            hintText: '0',
            isPrice: true,
            isNumberKey: true,
            isValidate: false,
          ),
        ],
      ),
    );
  }
}
