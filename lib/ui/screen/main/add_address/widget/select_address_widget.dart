import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shipf/data/model/address/address.dart';
import 'package:shipf/data/model/address/address_model.dart';
import 'package:shipf/ui/screen/main/add_address/cubit/add_address_cubit.dart';
import 'package:shipf/ui/screen/main/add_address/cubit/add_address_state.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class SelectAddressWidget extends StatefulWidget {
  final String label;
  final bool isDistrict;
  final bool isWard;
  final bool enableSelect;
  final AddressDataResponse? addressData;
  final bool isDeliver;

  const SelectAddressWidget(
      {Key? key,
      required this.label,
      this.isDistrict = false,
      this.isWard = false,
      this.enableSelect = false,
      this.addressData,
      this.isDeliver = false})
      : super(key: key);

  @override
  State<SelectAddressWidget> createState() => _SelectAddressWidgetState();
}

class _SelectAddressWidgetState extends State<SelectAddressWidget> {
  late AddAddressCubit _addAddressCubit;
  int indexProvince = -1;
  int indexDistrict = -1;
  int indexWard = -1;
  int indexProvinceDeliver = -1;
  int indexDistrictDeliver = -1;
  int indexWardDeliver = -1;
  AddressDataResponse? get addressData => widget.addressData;

  @override
  void initState() {
    _addAddressCubit = context.read<AddAddressCubit>();

    super.initState();
  }

  void getProvince() async {
    final provinces = await _addAddressCubit.getProvinces();
    final indexProvince = provinces.indexWhere(
        (element) => element.id.toString() == addressData!.codes.province);
    _addAddressCubit.updateProvince(provinces[indexProvince]);
  }

  void getDistrict() async {
    final districts = await _addAddressCubit.getDistricts(
        provinceId: int.parse(addressData!.codes.province));
    final indexDistrict = districts.indexWhere(
        (element) => element.id.toString() == addressData!.codes.district);
    _addAddressCubit.updateDistrict(districts[indexDistrict]);
  }

  void getWard() async {
    final wards = await _addAddressCubit.getWards(
        districtId: int.parse(addressData!.codes.district));
    final indexWard = wards.indexWhere(
        (element) => element.id.toString() == addressData!.codes.ward);
    _addAddressCubit.updateWard(wards[indexWard]);
  }

//Deliver
  void getProvinceDeliver() async {
    final provinces = await _addAddressCubit.getProvincesDeliver();
    final indexProvince = provinces.indexWhere(
        (element) => element.id.toString() == addressData!.codes.province);
    _addAddressCubit.updateProvinceDeliver(provinces[indexProvince]);
  }

  void getDistrictDeliver() async {
    final districts = await _addAddressCubit.getDistrictsDeliver(
        provinceId: int.parse(addressData!.codes.province));
    final indexDistrict = districts.indexWhere(
        (element) => element.id.toString() == addressData!.codes.district);
    _addAddressCubit.updateDistrictDeliver(districts[indexDistrict]);
  }

  void getWardDeliver() async {
    final wards = await _addAddressCubit.getWardsDeliver(
        districtId: int.parse(addressData!.codes.district));
    final indexWard = wards.indexWhere(
        (element) => element.id.toString() == addressData!.codes.ward);
    _addAddressCubit.updateWardDeliver(wards[indexWard]);
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
              if (widget.isDeliver) {
                if (widget.isWard) {
                  setState(() {
                    indexWardDeliver = index;
                    _addAddressCubit.updateWardDeliver(wards![index]);
                  });
                } else if (widget.isDistrict) {
                  _addAddressCubit.getWardsDeliver(
                      districtId: districts![index].id);
                  setState(() {
                    indexDistrictDeliver = index;
                  });
                  _addAddressCubit.updateDistrictDeliver(districts[index]);
                } else {
                  _addAddressCubit.getDistrictsDeliver(
                      provinceId: provinces[index].id, isUpdateProvince: true);
                  setState(() {
                    indexProvinceDeliver = index;
                  });
                  _addAddressCubit.updateProvinceDeliver(provinces[index]);
                }
              } else {
                if (widget.isWard) {
                  setState(() {
                    indexWard = index;
                    _addAddressCubit.updateWard(wards![index]);
                  });
                } else if (widget.isDistrict) {
                  _addAddressCubit.getWards(districtId: districts![index].id);
                  setState(() {
                    indexDistrict = index;
                  });
                  _addAddressCubit.updateDistrict(districts[index]);
                } else {
                  _addAddressCubit.getDistricts(
                      provinceId: provinces[index].id, isUpdateProvince: true);
                  setState(() {
                    indexProvince = index;
                  });
                  _addAddressCubit.updateProvince(provinces[index]);
                }
              }

              Navigator.pop(context);
            },
            child: Padding(
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
    if (widget.isDeliver) {
      addressData != null ? getProvinceDeliver() : null;
      addressData != null ? getDistrictDeliver() : null;
      addressData != null ? getWardDeliver() : null;
    } else {
      addressData != null ? getProvince() : null;
      addressData != null ? getDistrict() : null;
      addressData != null ? getWard() : null;
    }
    return BlocBuilder<AddAddressCubit, AddAddressState>(
      builder: (context, locationState) {
        return GestureDetector(
            onTap: () {
              widget.isDeliver
                  ? widget.isWard
                      ? locationState.wardsDeliver != null
                          ? _modalButtonAddress(
                              provinces: locationState.provinces!,
                              districts: locationState.districtsDeliver,
                              wards: locationState.wardsDeliver)
                          : null
                      : widget.isDistrict
                          ? locationState.districts != null
                              ? _modalButtonAddress(
                                  provinces: locationState.provinces!,
                                  districts: locationState.districtsDeliver,
                                  wards: locationState.wardsDeliver)
                              : null
                          : _modalButtonAddress(
                              provinces: locationState.provinces ?? [],
                              districts: locationState.districtsDeliver,
                              wards: locationState.wardsDeliver)
                  : widget.isWard
                      ? locationState.wards != null
                          ? _modalButtonAddress(
                              provinces: locationState.provinces!,
                              districts: locationState.districts,
                              wards: locationState.wards)
                          : null
                      : widget.isDistrict
                          ? locationState.districts != null
                              ? _modalButtonAddress(
                                  provinces: locationState.provinces!,
                                  districts: locationState.districts,
                                  wards: locationState.wards)
                              : null
                          : _modalButtonAddress(
                              provinces: locationState.provinces ?? [],
                              districts: locationState.districts,
                              wards: locationState.wards);
            },
            child: FormField(
              validator: (_) {
                if (widget.isDeliver) {
                  if (widget.isWard && locationState.wardDeliver == null) {
                    _addAddressCubit.updateWardDeliverError();
                  } else if (widget.isDistrict &&
                      locationState.districtDeliver == null) {
                    _addAddressCubit.updateDistrictDeliverError();
                  } else if (locationState.provinceDeliver == null) {
                    _addAddressCubit.updateProvinceDeliverError();
                  }
                } else {
                  if (widget.isWard && locationState.ward == null) {
                    _addAddressCubit.updateWardError();
                  } else if (widget.isDistrict &&
                      locationState.district == null) {
                    _addAddressCubit.updateDistrictError();
                  } else if (locationState.province == null) {
                    _addAddressCubit.updateProvinceError();
                  }
                }

                return null;
              },
              builder: (FormFieldState<String> state) {
                return InputDecorator(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: backgroundTextField,
                      errorStyle: TextStyle(fontSize: 10.sp, color: Colors.red),
                      // labelText: widget.label,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelStyle: textBody,
                      floatingLabelStyle: textBody.copyWith(
                        color: Colors.grey,
                      ),
                      errorText: widget.isDeliver
                          ? widget.isWard
                              ? locationState.errorWardDeliver.isNotEmpty
                                  ? locationState.errorWardDeliver
                                  : null
                              : widget.isDistrict
                                  ? locationState
                                          .errorDistrictDeliver.isNotEmpty
                                      ? locationState.errorDistrictDeliver
                                      : null
                                  : locationState
                                          .errorProvinceDeliver.isNotEmpty
                                      ? locationState.errorProvinceDeliver
                                      : null
                          : widget.isWard
                              ? locationState.errorWard.isNotEmpty
                                  ? locationState.errorWard
                                  : null
                              : widget.isDistrict
                                  ? locationState.errorDistrict.isNotEmpty
                                      ? locationState.errorDistrict
                                      : null
                                  : locationState.errorProvince.isNotEmpty
                                      ? locationState.errorProvince
                                      : null,
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
                      widget.isDeliver
                          ? widget.isWard
                              ? locationState.wardsDeliver != null &&
                                      indexWardDeliver != -1 &&
                                      locationState.wardDeliver != null
                                  ? locationState
                                      .wardsDeliver![indexWardDeliver].name
                                  : locationState.wardDeliver != null
                                      ? locationState.wardDeliver!.name
                                      : 'Chọn Phường/Xã/Thị trấn'
                              : widget.isDistrict
                                  ? locationState.districtsDeliver != null &&
                                          indexDistrictDeliver != -1 &&
                                          locationState.districtDeliver != null
                                      ? locationState
                                          .districtsDeliver![
                                              indexDistrictDeliver]
                                          .name
                                      : locationState.districtDeliver != null
                                          ? locationState.districtDeliver!.name
                                          : 'Chọn Quận/Huyện'
                                  : locationState.provinceDeliver != null
                                      ? locationState.provinceDeliver!.name
                                      : indexProvinceDeliver != -1
                                          ? locationState
                                              .provinces![indexProvinceDeliver]
                                              .name
                                          : 'Chọn Tỉnh/Thành phố'
                          : widget.isWard
                              ? locationState.wards != null &&
                                      indexWard != -1 &&
                                      locationState.ward != null
                                  ? locationState.wards![indexWard].name
                                  : locationState.ward != null
                                      ? locationState.ward!.name
                                      : 'Chọn Phường/Xã/Thị trấn'
                              : widget.isDistrict
                                  ? locationState.districts != null &&
                                          indexDistrict != -1 &&
                                          locationState.district != null
                                      ? locationState
                                          .districts![indexDistrict].name
                                      : locationState.district != null
                                          ? locationState.district!.name
                                          : 'Chọn Quận/Huyện'
                                  : locationState.province != null
                                      ? locationState.province!.name
                                      : indexProvince != -1
                                          ? locationState
                                              .provinces![indexProvince].name
                                          : 'Chọn Tỉnh/Thành phố',
                      style: textBody.copyWith(
                          color: widget.isDeliver
                              ? widget.isWard
                                  ? locationState.wardsDeliver != null
                                      ? titleColor
                                      : borderColor
                                  : widget.isDistrict
                                      ? locationState.districtsDeliver != null
                                          ? titleColor
                                          : borderColor
                                      : titleColor
                              : widget.isWard
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
            ));
      },
    );
  }
}
