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

class OrderAddressWidget extends StatelessWidget {
  OrderCubit orderCubit;
  final bool isUpdate;

  GlobalKey<FormState> addressFormKey;

  OrderAddressWidget(
      {super.key,
      required this.orderCubit,
      required this.addressFormKey,
      this.isUpdate = false});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          address(context,
              type: text.sending_place,
              nameController: orderCubit.state.senderNameController!,
              phoneController: orderCubit.state.senderPhoneController!,
              addressController: orderCubit.state.senderAddressController!),
          VerticalSpace(
            kDefaultPaddingHeightScreen,
            color: backgroundColor,
          ),
          address(context,
              type: text.recipients,
              nameController: orderCubit.state.receiverNameController!,
              phoneController: orderCubit.state.receiverPhoneController!,
              addressController: orderCubit.state.receiverAddressController!,
              isDeliver: true),
          Padding(
            padding: EdgeInsets.all(kDefaultPaddingWidthWidget),
            child: PrimaryButton(
              label: text.continuee,
              onPressed: () {
                if (addressFormKey.currentState!.validate() &&
                    orderCubit.state.province != null &&
                    orderCubit.state.district != null &&
                    orderCubit.state.ward != null &&
                    orderCubit.state.provinceDeliver != null &&
                    orderCubit.state.districtDeliver != null &&
                    orderCubit.state.wardDeliver != null) {
                  orderCubit.updateStepOrder(StepOrderType.parcel);
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
                visible: !isUpdate,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => context.router.push(AddressPage(
                    isDeliver: isDeliver,
                    selectAddress: (address) async {
                      await orderCubit.selectAddress(
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
                        readOnly: isUpdate && !isDeliver),
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
                        readOnly: isUpdate && !isDeliver),
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
                ? orderCubit.state.addressDeliver
                : orderCubit.state.addressPick,
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
            readOnly: isUpdate && !isDeliver,
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
          readOnly: isUpdate && !isDeliver,
          isDistrict: isDistrict,
          isWard: isWard,
          isDeliver: isDeliver,
          provinces: orderCubit.state.provinces,
          districts: isDeliver
              ? orderCubit.state.districtsDeliver
              : orderCubit.state.districts,
          wards: isDeliver
              ? orderCubit.state.wardsDeliver
              : orderCubit.state.wards,
          province: isDeliver
              ? orderCubit.state.provinceDeliver
              : orderCubit.state.province,
          district: isDeliver
              ? orderCubit.state.districtDeliver
              : orderCubit.state.district,
          ward:
              isDeliver ? orderCubit.state.wardDeliver : orderCubit.state.ward,
          errorProvince: isDeliver
              ? orderCubit.state.errorProvinceDeliver
              : orderCubit.state.errorProvince,
          errorDistrict: isDeliver
              ? orderCubit.state.errorDistrictDeliver
              : orderCubit.state.errorDistrict,
          errorWard: isDeliver
              ? orderCubit.state.errorWardDeliver
              : orderCubit.state.errorWard,
          selectProvince: (index) {
            if (isDeliver) {
              orderCubit.getDistrictsDeliver(
                  provinceId: orderCubit.state.provinces[index].id);
              orderCubit
                  .updateProvinceDeliver(orderCubit.state.provinces[index]);
            } else {
              orderCubit.getDistricts(
                provinceId: orderCubit.state.provinces[index].id,
              );
              orderCubit.updateProvince(orderCubit.state.provinces[index]);
            }
          },
          selectDistrict: (index) {
            if (isDeliver) {
              orderCubit.getWardsDeliver(
                  districtId: orderCubit.state.districtsDeliver[index].id);
              orderCubit.updateDistrictDeliver(
                  orderCubit.state.districtsDeliver[index]);
            } else {
              orderCubit.getWards(
                  districtId: orderCubit.state.districts[index].id);
              orderCubit.updateDistrict(orderCubit.state.districts[index]);
            }
          },
          selectWard: (index) {
            isDeliver
                ? orderCubit
                    .updateWardDeliver(orderCubit.state.wardsDeliver[index])
                : orderCubit.updateWard(orderCubit.state.wards[index]);
          },
          validator: (_) {
            if (isDeliver) {
              if (isWard && orderCubit.state.wardDeliver == null) {
                orderCubit.updateWardDeliverError();
              } else if (isDistrict &&
                  orderCubit.state.districtDeliver == null) {
                orderCubit.updateDistrictDeliverError();
              } else if (orderCubit.state.provinceDeliver == null) {
                orderCubit.updateProvinceDeliverError();
              }
            } else {
              if (isWard && orderCubit.state.ward == null) {
                orderCubit.updateWardError();
              } else if (isDistrict && orderCubit.state.district == null) {
                orderCubit.updateDistrictError();
              } else if (orderCubit.state.province == null) {
                orderCubit.updateProvinceError();
              }
            }
            return null;
          },
        ),
      ],
    );
  }
}
