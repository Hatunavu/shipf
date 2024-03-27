// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shipf/data/model/address/address.dart';
import 'package:shipf/ui/shared/utils/functions.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class SelectAddressWidget extends StatefulWidget {
  final String label;
  final bool isDistrict;
  final bool isWard;
  final bool isDeliver;
  final Function(int index) selectProvince;
  final Function(int index) selectDistrict;
  final Function(int index) selectWard;
  final List<AddressDataModel> provinces;
  final List<AddressDataModel> districts;
  final List<AddressDataModel> wards;
  final AddressDataModel? province;
  final AddressDataModel? district;
  final AddressDataModel? ward;
  final String errorProvince;
  final String errorDistrict;
  final String errorWard;
  final String? Function(String?)? validator;
  final bool readOnly;
  final bool isMultiSelect;
  final Function(List<AddressDataModel> provinces)? multiProvince;
  final List<AddressDataModel> multiProvinces;

  SelectAddressWidget(
      {Key? key,
      required this.label,
      this.isDistrict = false,
      this.isWard = false,
      this.isDeliver = false,
      required this.selectProvince,
      required this.selectDistrict,
      required this.selectWard,
      this.provinces = const [],
      this.districts = const [],
      this.wards = const [],
      this.province,
      this.district,
      this.ward,
      this.errorProvince = '',
      this.errorDistrict = '',
      this.errorWard = '',
      this.validator,
      this.readOnly = false,
      this.isMultiSelect = false,
      this.multiProvince,
      this.multiProvinces = const []})
      : super(key: key);

  @override
  State<SelectAddressWidget> createState() => _SelectAddressWidgetState();
}

class _SelectAddressWidgetState extends State<SelectAddressWidget> {
  List<AddressDataModel> listSelect = [];
  late TextEditingController controller;
  List<AddressDataModel> resultProvinces = [];
  List<AddressDataModel> resultDistricts = [];
  List<AddressDataModel> resultWards = [];

  @override
  void initState() {
    resultProvinces = [...widget.provinces];

    // listSelect = [...widget.multiProvinces];
    controller = TextEditingController();
    super.initState();
  }

  Widget setupAlertDialogContainer() {
    return StatefulBuilder(builder: (context, setState) {
      return Column(
        children: [
          searchAddress(
            clearSearch: () {
              setState(() {
                resultProvinces = [...widget.provinces];
                resultDistricts = [...widget.districts];
                resultWards = [...widget.wards];
              });
              controller.clear();
            },
            onChanged: (value) {
              setState(() {
                resultProvinces.clear();
                resultDistricts.clear();
                resultWards.clear();
                if (widget.isWard) {
                  for (var ward in widget.wards) {
                    if (ward.name.toLowerCase().contains(value.toLowerCase())) {
                      setState(() {
                        resultWards.add(ward);
                      });
                    }
                  }
                } else if (widget.isDistrict) {
                  for (var district in widget.districts) {
                    if (district.name
                        .toLowerCase()
                        .contains(value.toLowerCase())) {
                      setState(() {
                        resultDistricts.add(district);
                      });
                    }
                  }
                } else {
                  for (var province in widget.provinces) {
                    if (province.name
                        .toLowerCase()
                        .contains(value.toLowerCase())) {
                      setState(() {
                        resultProvinces.add(province);
                      });
                    }
                  }
                }
              });
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.isWard
                    ? resultWards.length
                    : widget.isDistrict
                        ? resultDistricts.length
                        : resultProvinces.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    visualDensity:
                        const VisualDensity(horizontal: 0, vertical: -4),
                    title: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        unfocus(context);
                        if (widget.isMultiSelect) {
                          setState(() {
                            if (listSelect
                                .map((e) => e.id)
                                .toList()
                                .contains(resultProvinces[index].id)) {
                              listSelect.removeWhere(
                                  (e) => e.id == resultProvinces[index].id);
                            } else {
                              listSelect.add(resultProvinces[index]);
                            }
                          });
                        } else {
                          controller.clear();
                          resultProvinces = [...widget.provinces];
                          resultDistricts = [...widget.districts];
                          resultWards = [...widget.wards];
                          if (widget.isWard) {
                            widget.selectWard(index);
                          } else if (widget.isDistrict) {
                            widget.selectDistrict(index);
                          } else {
                            widget.selectProvince(index);
                          }
                          Navigator.pop(context);
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPaddingWidthScreen,
                            vertical: kDefaultPaddingHeightScreen),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
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
                                        ? resultWards[index].name
                                        : widget.isDistrict
                                            ? resultDistricts[index].name
                                            : resultProvinces[index].name,
                                    style: textBody.copyWith(
                                      color: titleColor,
                                    )),
                              ],
                            ),
                            Visibility(
                              visible: widget.isMultiSelect &&
                                  listSelect
                                      .map((e) => e.id)
                                      .toList()
                                      .contains(resultProvinces[index].id),
                              child: const Icon(
                                Icons.done,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      );
    });
  }

  void _modalButtonAddress(
    BuildContext context,
  ) {
    showModalBottomSheet(
      isDismissible: false,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.clear();
                        // listSelect = [...widget.multiProvinces];
                        setState(() {
                          resultProvinces = [...widget.provinces];
                        });
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
                    Visibility(
                      visible: widget.isMultiSelect,
                      child: InkWell(
                        onTap: () {
                          controller.clear();
                          widget.multiProvince!(listSelect);
                          setState(() {
                            resultProvinces = [...widget.provinces];
                          });
                          Navigator.pop(context);
                        },
                        child: SizedBox(
                          height: 50.h,
                          width: 0.1.sw,
                          child: const Icon(
                            Icons.done,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 0.55.sh, child: setupAlertDialogContainer()),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    listSelect = [...widget.multiProvinces];
    resultDistricts = [...widget.districts];
    resultWards = [...widget.wards];
    List<String> stringList =
        widget.multiProvinces.map((province) => province.name).toList();
    return GestureDetector(
        onTap: widget.readOnly
            ? null
            : () {
                unfocus(context);
                widget.isWard
                    ? resultWards.isNotEmpty
                        ? _modalButtonAddress(context)
                        : null
                    : widget.isDistrict
                        ? resultDistricts.isNotEmpty
                            ? _modalButtonAddress(context)
                            : null
                        : _modalButtonAddress(
                            context,
                          );
              },
        child: FormField(
          validator: widget.validator,
          builder: (FormFieldState<String> state) {
            return InputDecorator(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: backgroundTextField,
                  errorStyle: TextStyle(fontSize: 10.sp, color: Colors.red),
                  // labelText: label,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: textBody,
                  floatingLabelStyle: textBody.copyWith(
                    color: Colors.grey,
                  ),
                  errorText: widget.isWard
                      ? widget.errorWard.isNotEmpty
                          ? widget.errorWard
                          : null
                      : widget.isDistrict
                          ? widget.errorDistrict.isNotEmpty
                              ? widget.errorDistrict
                              : null
                          : widget.errorProvince.isNotEmpty
                              ? widget.errorProvince
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
                      horizontal: kDefaultPaddingWidthWidget, vertical: 5.h),
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
                  widget.isMultiSelect
                      ? widget.multiProvinces.isNotEmpty
                          ? stringList.join(', ')
                          : 'Chọn Tỉnh/Thành phố'
                      : widget.isWard
                          ? widget.ward != null
                              ? widget.ward!.name
                              : 'Chọn Phường/Xã/Thị trấn'
                          : widget.isDistrict
                              ? widget.district != null
                                  ? widget.district!.name
                                  : 'Chọn Quận/Huyện'
                              : widget.province != null
                                  ? widget.province!.name
                                  : 'Chọn Tỉnh/Thành phố',
                  style: textBody.copyWith(
                      color: widget.readOnly
                          ? greyText
                          : widget.isWard
                              ? resultWards.isNotEmpty
                                  ? titleColor
                                  : borderColor
                              : widget.isDistrict
                                  ? resultDistricts.isNotEmpty
                                      ? titleColor
                                      : borderColor
                                  : titleColor),
                  maxLines: 100,
                  overflow: TextOverflow.ellipsis,
                ));
          },
        ));
  }

  Widget searchAddress({Function(String)? onChanged, Function()? clearSearch}) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPaddingWidthScreen),
      child: TextFormField(
          onChanged: onChanged,
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Ionicons.search,
              size: 18.sp,
              color: primaryColor,
            ),
            suffixIcon: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: Icon(
                Icons.close,
                size: 18.sp,
                color: greyText,
              ),
              onPressed: clearSearch,
            ),
            labelStyle: primaryTitleStyle.copyWith(
                color: primaryColor, fontWeight: FontWeight.w400),
            floatingLabelStyle: primaryTitleStyle.copyWith(color: primaryColor),
            contentPadding: EdgeInsets.only(
                top: kDefaultPaddingHeightScreen,
                bottom: kDefaultPaddingHeightScreen,
                left: kDefaultPaddingWidthWidget,
                right: kDefaultPaddingWidthWidget),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: greyText),
                borderRadius: BorderRadius.circular(secondaryBorderRadius)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: greyText),
                borderRadius: BorderRadius.circular(secondaryBorderRadius)),
          )),
    );
  }
}
