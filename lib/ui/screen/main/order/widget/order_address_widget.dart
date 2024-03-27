// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shipf/data/model/address/address.dart';
import 'package:shipf/enums/enum_step_order.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/screen/main/order/cubit/order_cubit.dart';
import 'package:shipf/ui/screen/main/order/widget/order_label_text_filed_widget.dart';
import 'package:shipf/ui/screen/main/order/widget/select_address_widget.dart';
import 'package:shipf/ui/shared/textfield/primary_textfield.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';
import 'package:shipf/ui/shared/widget/space/horizontal_space.dart';
import 'package:shipf/ui/shared/widget/space/vertical_space.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class OrderAddressWidget extends StatefulWidget {
  OrderCubit orderCubit;
  final bool isUpdate;

  GlobalKey<FormState> addressFormKey;

  OrderAddressWidget(
      {super.key,
      required this.orderCubit,
      required this.addressFormKey,
      this.isUpdate = false});

  @override
  State<OrderAddressWidget> createState() => _OrderAddressWidgetState();
}

class _OrderAddressWidgetState extends State<OrderAddressWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          address(context,
              type: text.sending_place,
              nameController: widget.orderCubit.state.senderNameController!,
              phoneController: widget.orderCubit.state.senderPhoneController!,
              addressController:
                  widget.orderCubit.state.senderAddressController!),
          VerticalSpace(
            kDefaultPaddingHeightScreen,
            color: backgroundColor,
          ),
          address(context,
              type: text.recipients,
              nameController: widget.orderCubit.state.receiverNameController!,
              phoneController: widget.orderCubit.state.receiverPhoneController!,
              addressController:
                  widget.orderCubit.state.receiverAddressController!,
              isDeliver: true),
          Padding(
            padding: EdgeInsets.all(kDefaultPaddingWidthWidget),
            child: PrimaryButton(
              label: text.continuee,
              onPressed: () {
                if (widget.addressFormKey.currentState!.validate() &&
                    widget.orderCubit.state.province != null &&
                    widget.orderCubit.state.district != null &&
                    widget.orderCubit.state.ward != null &&
                    widget.orderCubit.state.provinceDeliver != null &&
                    widget.orderCubit.state.districtDeliver != null &&
                    widget.orderCubit.state.wardDeliver != null) {
                  widget.orderCubit.updateStepOrder(StepOrderType.parcel);
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget address(BuildContext context,
      {required String type,
      required TextEditingController nameController,
      required TextEditingController phoneController,
      required TextEditingController addressController,
      bool isDeliver = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(
              horizontal: kDefaultPaddingWidthWidget,
              vertical: kDefaultPaddingHeightScreen)
          .copyWith(top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: kDefaultPaddingHeightScreen,
                    top: kDefaultPaddingWidthWidget),
                child: Text(
                  type,
                  style: textHeading,
                ),
              ),
              Visibility(
                visible: !widget.isUpdate,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => context.router.push(AddressPage(
                    isDeliver: isDeliver,
                    selectAddress: (address) async {
                      await widget.orderCubit.selectAddress(
                          address: address, isDeliver: isDeliver);
                      if (isDeliver) {
                        nameController.text = address.name;
                        phoneController.text = address.phone;
                        addressController.text = address.address;
                      } else {
                        nameController.text = address.name;
                        phoneController.text = address.phone;
                        addressController.text = address.address;
                      }
                    },
                  )),
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: kDefaultPaddingHeightScreen,
                        top: kDefaultPaddingWidthWidget),
                    child: Text(
                      'Địa chỉ đã lưu',
                      style: primaryTitleStyle.copyWith(color: primaryColor),
                    ),
                  ),
                ),
              ),
            ],
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
                        readOnly: widget.isUpdate && !isDeliver),
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
                        showPrefixIcon: false,
                        readOnly: widget.isUpdate && !isDeliver),
                  ],
                ),
              )
            ],
          ),
          VerticalSpace(
            kDefaultPaddingHeightScreen,
          ),
          itemSelectLocation(
            label: text.city,
            isDeliver: isDeliver,
            addressData: isDeliver
                ? widget.orderCubit.state.addressDeliver
                : widget.orderCubit.state.addressPick,
          ),
          VerticalSpace(
            kDefaultPaddingHeightScreen,
          ),
          itemSelectLocation(
              label: text.district, isDistrict: true, isDeliver: isDeliver),
          VerticalSpace(
            kDefaultPaddingHeightScreen,
          ),
          itemSelectLocation(
              label: text.ward, isWard: true, isDeliver: isDeliver),
          VerticalSpace(
            kDefaultPaddingHeightScreen,
          ),
          OrderLabelTextFieldWidget(label: text.address),
          PrimaryTextField(
            label: '',
            controller: addressController,
            hintText: text.address,
            isAddress: true,
            fieldRequire: text.address,
            readOnly: widget.isUpdate && !isDeliver,
          ),
        ],
      ),
    );
  }

  Widget itemSelectLocation({
    bool isDistrict = false,
    bool isWard = false,
    required String label,
    bool isDeliver = false,
    AddressSavedData? addressData,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrderLabelTextFieldWidget(label: label),
        SelectAddressWidget(
          label: label,
          readOnly: widget.isUpdate && !isDeliver,
          isDistrict: isDistrict,
          isWard: isWard,
          isDeliver: isDeliver,
          provinces: widget.orderCubit.state.provinces,
          districts: isDeliver
              ? widget.orderCubit.state.districtsDeliver
              : widget.orderCubit.state.districts,
          wards: isDeliver
              ? widget.orderCubit.state.wardsDeliver
              : widget.orderCubit.state.wards,
          province: isDeliver
              ? widget.orderCubit.state.provinceDeliver
              : widget.orderCubit.state.province,
          district: isDeliver
              ? widget.orderCubit.state.districtDeliver
              : widget.orderCubit.state.district,
          ward: isDeliver
              ? widget.orderCubit.state.wardDeliver
              : widget.orderCubit.state.ward,
          errorProvince: isDeliver
              ? widget.orderCubit.state.errorProvinceDeliver
              : widget.orderCubit.state.errorProvince,
          errorDistrict: isDeliver
              ? widget.orderCubit.state.errorDistrictDeliver
              : widget.orderCubit.state.errorDistrict,
          errorWard: isDeliver
              ? widget.orderCubit.state.errorWardDeliver
              : widget.orderCubit.state.errorWard,
          selectProvince: (index) {
            if (isDeliver) {
              widget.orderCubit.getDistrictsDeliver(
                  provinceId: widget.orderCubit.state.provinces[index].id);
              widget.orderCubit.updateProvinceDeliver(
                  widget.orderCubit.state.provinces[index]);
            } else {
              widget.orderCubit.getDistricts(
                provinceId: widget.orderCubit.state.provinces[index].id,
              );
              widget.orderCubit
                  .updateProvince(widget.orderCubit.state.provinces[index]);
            }
            setState(() {});
          },
          selectDistrict: (index) {
            if (isDeliver) {
              widget.orderCubit.getWardsDeliver(
                  districtId:
                      widget.orderCubit.state.districtsDeliver[index].id);
              widget.orderCubit.updateDistrictDeliver(
                  widget.orderCubit.state.districtsDeliver[index]);
            } else {
              widget.orderCubit.getWards(
                  districtId: widget.orderCubit.state.districts[index].id);
              widget.orderCubit
                  .updateDistrict(widget.orderCubit.state.districts[index]);
            }
          },
          selectWard: (index) {
            isDeliver
                ? widget.orderCubit.updateWardDeliver(
                    widget.orderCubit.state.wardsDeliver[index])
                : widget.orderCubit
                    .updateWard(widget.orderCubit.state.wards[index]);
          },
          validator: (_) {
            if (isDeliver) {
              if (isWard && widget.orderCubit.state.wardDeliver == null) {
                widget.orderCubit.updateWardDeliverError();
              } else if (isDistrict &&
                  widget.orderCubit.state.districtDeliver == null) {
                widget.orderCubit.updateDistrictDeliverError();
              } else if (widget.orderCubit.state.provinceDeliver == null) {
                widget.orderCubit.updateProvinceDeliverError();
              }
            } else {
              if (isWard && widget.orderCubit.state.ward == null) {
                widget.orderCubit.updateWardError();
              } else if (isDistrict &&
                  widget.orderCubit.state.district == null) {
                widget.orderCubit.updateDistrictError();
              } else if (widget.orderCubit.state.province == null) {
                widget.orderCubit.updateProvinceError();
              }
            }
            return null;
          },
        ),
      ],
    );
  }
}
