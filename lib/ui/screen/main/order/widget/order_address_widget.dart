// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shipf/enums/enum_step_order.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/screen/main/add_address/widget/select_address_widget.dart';
import 'package:shipf/ui/screen/main/order/cubit/order_cubit.dart';
import 'package:shipf/ui/screen/main/order/widget/order_label_text_filed_widget.dart';
import 'package:shipf/ui/shared/textfield/primary_textfield.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';
import 'package:shipf/ui/shared/widget/space/horizontal_space.dart';
import 'package:shipf/ui/shared/widget/space/vertical_space.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class OrderAddressWidget extends StatefulWidget {
  OrderCubit orderCubit;
  OrderAddressWidget({super.key, required this.orderCubit});

  @override
  State<OrderAddressWidget> createState() => _OrderAddressWidgetState();
}

class _OrderAddressWidgetState extends State<OrderAddressWidget> {
  final TextEditingController _senderController = TextEditingController();
  final TextEditingController _senderPhoneController = TextEditingController();
  final TextEditingController _senderAddressController =
      TextEditingController();
  final TextEditingController _receiverController = TextEditingController();
  final TextEditingController _receiverPhoneController =
      TextEditingController();
  final TextEditingController _receiverAddressController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          address(
              type: text.sending_place,
              nameController: _senderController,
              phoneController: _senderPhoneController,
              addressController: _senderAddressController),
          VerticalSpace(
            kDefaultPaddingHeightScreen,
            color: backgroundColor,
          ),
          address(
              type: text.recipients,
              nameController: _receiverController,
              phoneController: _receiverPhoneController,
              addressController: _receiverAddressController),
          Padding(
            padding: EdgeInsets.all(kDefaultPaddingWidthWidget),
            child: PrimaryButton(
              label: text.continuee,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.orderCubit.updateStepOrder(StepOrderType.parcel);
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget address(
      {required String type,
      required TextEditingController nameController,
      required TextEditingController phoneController,
      required TextEditingController addressController}) {
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
          VerticalSpace(
            kDefaultPaddingHeightScreen,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OrderLabelTextFieldWidget(label: text.full_name),
                    PrimaryTextField(
                      label: '',
                      controller: nameController,
                      hintText: text.full_name,
                      fieldRequire: text.full_name,
                    ),
                  ],
                ),
              ),
              HorizontalSpace(
                kDefaultPaddingWidthScreen / 2,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OrderLabelTextFieldWidget(label: text.phone),
                    PrimaryTextField(
                      label: '',
                      controller: phoneController,
                      hintText: text.phone,
                      isPhone: true,
                    ),
                  ],
                ),
              )
            ],
          ),
          VerticalSpace(
            kDefaultPaddingHeightScreen,
          ),
          itemSelectLocation(label: text.city),
          VerticalSpace(
            kDefaultPaddingHeightScreen,
          ),
          itemSelectLocation(label: text.district, isDistrict: true),
          VerticalSpace(
            kDefaultPaddingHeightScreen,
          ),
          itemSelectLocation(label: text.ward, isWard: true),
          VerticalSpace(
            kDefaultPaddingHeightScreen,
          ),
          OrderLabelTextFieldWidget(label: text.address),
          PrimaryTextField(
            label: '',
            controller: addressController,
            hintText: text.address,
            isAddress: true,
          ),
        ],
      ),
    );
  }

  Widget itemSelectLocation(
      {bool isDistrict = false, bool isWard = false, required String label}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrderLabelTextFieldWidget(label: label),
        SelectAddressWidget(
          label: label,
          isDistrict: isDistrict,
          isWard: isWard,
        ),
      ],
    );
  }
}
