import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shipf/data/model/address/address.dart';
import 'package:shipf/ui/screen/main/add_address/cubit/add_address_cubit.dart';
import 'package:shipf/ui/screen/main/add_address/cubit/add_address_state.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class SelectAddressWidget extends StatefulWidget {
  final String label;
  final bool isDistrict;
  final bool isWard;
  final bool enableSelect;
  final AddressDataModel? addressData;
  final bool isRecipients;

  const SelectAddressWidget(
      {Key? key,
      required this.label,
      this.isDistrict = false,
      this.isWard = false,
      this.enableSelect = false,
      this.addressData,
      this.isRecipients = false})
      : super(key: key);

  @override
  State<SelectAddressWidget> createState() => _SelectAddressWidgetState();
}

class _SelectAddressWidgetState extends State<SelectAddressWidget> {
  late AddAddressCubit _addAddressCubit;
  int indexProvince = -1;
  int indexDistrict = -1;
  int indexWard = -1;
  int indexRecipientsProvince = -1;
  int indexRecipientsDistrict = -1;
  int indexRecipientsWard = -1;
  AddressDataModel? get addressData => widget.addressData;

  @override
  void initState() {
    _addAddressCubit = context.read<AddAddressCubit>();
    super.initState();
  }

  Widget setupAlertDialogContainer(
      {required List<AddressDataModel> provinces,
      List<AddressDataModel>? districts,
      List<AddressDataModel>? wards}) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.isWard
          ? wards!.length
          : widget.isDistrict
              ? districts!.length
              : provinces.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          dense: true,
          contentPadding: EdgeInsets.zero,
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          title: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              if (widget.isWard) {
                setState(() {
                  indexWard = index;
                  _addAddressCubit.updateWard(wards![index],
                      isRecipients: widget.isRecipients);
                });
              } else if (widget.isDistrict) {
                _addAddressCubit.getWards(
                    districtId: districts![index].id,
                    isRecipients: widget.isRecipients);
                setState(() {
                  indexDistrict = index;
                });
                _addAddressCubit.updateDistrict(districts[index],
                    isRecipients: widget.isRecipients);
              } else {
                _addAddressCubit.getDistricts(
                    provinceId: provinces[index].id,
                    isRecipients: widget.isRecipients);
                setState(() {
                  widget.isRecipients
                      ? indexRecipientsProvince = index
                      : indexProvince = index;
                });
                _addAddressCubit.updateProvince(provinces[index],
                    isRecipients: widget.isRecipients);
              }
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPaddingWidthScreen,
                  vertical: kDefaultPaddingHeightScreen),
              child: Row(
                children: [
                  const Icon(
                    Ionicons.location,
                    color: primaryColor,
                  ),
                  SizedBox(
                    width: kDefaultPaddingWidthScreen,
                  ),
                  Text(
                      widget.isWard
                          ? wards![index].name
                          : widget.isDistrict
                              ? districts![index].name
                              : provinces[index].name,
                      style: textBody.copyWith(
                        color: titleColor,
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _modalButtonAddress(
      {required List<AddressDataModel> provinces,
      List<AddressDataModel>? districts,
      List<AddressDataModel>? wards}) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 50.h,
                  width: 1.sw,
                  color: backgroundTextField,
                  child: Text(
                    widget.label,
                    style: textHeading,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    height: 50.h,
                    width: 0.1.sw,
                    child: const Icon(
                      Icons.close,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
                height: 0.5.sh,
                child: setupAlertDialogContainer(
                    provinces: provinces, districts: districts, wards: wards)),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAddressCubit, AddAddressState>(
      builder: (context, locationState) {
        String addressLabel() {
          if (widget.isWard) {
            return widget.isRecipients
                ? (locationState.recipientsWards != null &&
                        indexRecipientsWard != -1 &&
                        locationState.recipientsWard != null)
                    ? locationState.recipientsWards![indexRecipientsWard].name
                    : 'Chọn Phường/Xã/Thị trấn'
                : (locationState.wards != null &&
                        indexWard != -1 &&
                        locationState.ward != null)
                    ? locationState.wards![indexWard].name
                    : 'Chọn Phường/Xã/Thị trấn';
          } else if (widget.isDistrict) {
            return widget.isRecipients
                ? locationState.recipientsDistricts != null &&
                        indexRecipientsDistrict != -1 &&
                        locationState.recipientsDistrict != null
                    ? locationState
                        .recipientsDistricts![indexRecipientsDistrict].name
                    : 'Chọn Quận/Huyện'
                : locationState.districts != null &&
                        indexDistrict != -1 &&
                        locationState.district != null
                    ? locationState.districts![indexDistrict].name
                    : 'Chọn Quận/Huyện';
          } else {
            return widget.isRecipients
                ? locationState.recipientsProvince != null
                    ? locationState.recipientsProvince!.name
                    : indexRecipientsProvince != -1
                        ? locationState.provinces![indexRecipientsProvince].name
                        : 'Chọn Tỉnh/Thành phố'
                : locationState.province != null
                    ? locationState.province!.name
                    : indexProvince != -1
                        ? locationState.provinces![indexProvince].name
                        : 'Chọn Tỉnh/Thành phố';
          }
        }

        return GestureDetector(
            onTap: () {
              _modalButtonAddress(
                  provinces: locationState.provinces ?? [],
                  districts: widget.isRecipients
                      ? locationState.recipientsDistricts
                      : locationState.districts,
                  wards: widget.isRecipients
                      ? locationState.recipientsWards
                      : locationState.wards);
            },
            child: Container(
              child: FormField(
                validator: (_) {
                  return widget.isWard
                      ? locationState.ward == null
                          ? 'Vui lòng chọn Phường/Xã/Thị trấn'
                          : null
                      : widget.isDistrict
                          ? locationState.district == null
                              ? 'Vui lòng chọn Quận/Huyện'
                              : null
                          : locationState.province == null
                              ? 'Vui lòng chọn Tỉnh/Thành phố'
                              : null;
                },
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: backgroundTextField,
                        errorStyle:
                            TextStyle(fontSize: 10.sp, color: Colors.red),
                        // labelText: widget.label,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelStyle: textBody,
                        floatingLabelStyle: textBody.copyWith(
                          color: Colors.grey,
                        ),
                        errorText: state.errorText,
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius:
                                BorderRadius.circular(secondaryBorderRadius)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius:
                                BorderRadius.circular(secondaryBorderRadius)),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: kDefaultPaddingWidthWidget),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.circular(secondaryBorderRadius)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.circular(secondaryBorderRadius)),
                      ),
                      child: Text(
                        addressLabel(),
                        style: textBody.copyWith(
                            color: widget.isWard
                                ? locationState.wards != null
                                    ? titleColor
                                    : borderColor
                                : widget.isDistrict
                                    ? locationState.districts != null
                                        ? titleColor
                                        : borderColor
                                    : titleColor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ));
                },
              ),
            ));
      },
    );
  }
}
