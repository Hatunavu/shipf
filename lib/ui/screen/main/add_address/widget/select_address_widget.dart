import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shipf/data/model/address/address_model.dart';
import 'package:shipf/data/model/location/location_model.dart';
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

  const SelectAddressWidget(
      {Key? key,
      required this.label,
      this.isDistrict = false,
      this.isWard = false,
      this.enableSelect = false,
      this.addressData})
      : super(key: key);

  @override
  State<SelectAddressWidget> createState() => _SelectAddressWidgetState();
}

class _SelectAddressWidgetState extends State<SelectAddressWidget> {
  late AddAddressCubit _addAddressCubit;
  int indexProvince = -1;
  int indexDistrict = -1;
  int indexWard = -1;
  AddressDataResponse? get addressData => widget.addressData;

  @override
  void initState() {
    _addAddressCubit = context.read<AddAddressCubit>();

    // final indexProvince = provinces
    //     .indexWhere((element) => element.code == addressData!.codes.province);
    // print(indexProvince);
    // addressData != null ? getProvice() : null;
    // addressData != null ? getDistrict() : null;
    // addressData != null ? getWard() : null;
    super.initState();
  }

  void getProvice() async {
    final provinces = await _addAddressCubit.getLocationProvinces();
    final indexProvince = provinces
        .indexWhere((element) => element.code == addressData!.codes.province);
    _addAddressCubit.updateProvince(provinces[indexProvince]);
  }

  void getDistrict() async {
    final districts = await _addAddressCubit.getLocationDistricts(
        provinceId: addressData!.codes.province);
    final indexDistrict = districts
        .indexWhere((element) => element.code == addressData!.codes.district);
    _addAddressCubit.updateDistrict(districts[indexDistrict]);
  }

  void getWard() async {
    final wards = await _addAddressCubit.getLocationWards(
        districtId: addressData!.codes.district);
    final indexWard = wards
        .indexWhere((element) => element.code == addressData!.codes.district);
    _addAddressCubit.updateDistrict(wards[indexWard]);
  }

  Widget setupAlertDialoadContainer(
      {required List<LocationData> provinces,
      List<LocationData>? districts,
      List<LocationData>? wards}) {
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
              widget.isDistrict
                  ? _addAddressCubit.getLocationWards(
                      districtId: districts![index].code)
                  : widget.isWard
                      ? null
                      : _addAddressCubit.getLocationDistricts(
                          provinceId: provinces[index].code,
                          isUpdateProvince: true);
              widget.isWard
                  ? setState(() {
                      indexWard = index;
                    })
                  : widget.isDistrict
                      ? setState(() {
                          indexDistrict = index;
                        })
                      : setState(() {
                          indexProvince = index;
                        });

              widget.isWard
                  ? _addAddressCubit.updateWard(wards![index])
                  : widget.isDistrict
                      ? _addAddressCubit.updateDistrict(districts![index])
                      : _addAddressCubit.updateProvince(provinces[index]);
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPaddingWidthScreen,
                  vertical: kDefaultPaddingHeightScreen),
              // color: Colors.amber,
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

  void _showDialog(
      {required List<LocationData> provinces,
      List<LocationData>? districts,
      List<LocationData>? wards}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(widget.label),
            content: setupAlertDialoadContainer(
                provinces: provinces, districts: districts, wards: wards),
          );
        });
  }

  void _modalButtonAddress(
      {required List<LocationData> provinces,
      List<LocationData>? districts,
      List<LocationData>? wards}) {
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
                height: 0.7.sh,
                child: setupAlertDialoadContainer(
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
        return GestureDetector(
            onTap: () {
              widget.isWard
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
            child: Container(
              child: FormField(
                validator: (_) {
                  return 'Vui lòng chọn Tỉnh/Thành phố';
                },
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: backgroundTextField,
                        errorStyle: const TextStyle(
                          fontSize: 10,
                        ),
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
                        widget.isWard
                            ? locationState.wards != null && indexWard != -1
                                ? locationState.wards![indexWard].name
                                : locationState.ward != null
                                    ? locationState.ward!.name
                                    : 'Chọn Phường/Xã/Thị trấn'
                            : widget.isDistrict
                                ? locationState.districts != null &&
                                        indexDistrict != -1
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
