// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shipf/data/model/address/address.dart';
import 'package:shipf/ui/shared/utils/functions.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class SelectAddressWidget extends StatelessWidget {
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

  List<AddressDataModel> listSelect = [];

  Widget setupAlertDialogContainer() {
    return StatefulBuilder(builder: (context, setState) {
      return Column(
        children: [
          // searchAddress(),
          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: isWard
                    ? wards.length
                    : isDistrict
                        ? districts.length
                        : provinces.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    visualDensity:
                        const VisualDensity(horizontal: 0, vertical: -4),
                    title: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        if (isMultiSelect) {
                          setState(() {
                            if (listSelect
                                .map((e) => e.id)
                                .toList()
                                .contains(provinces[index].id)) {
                              listSelect.removeWhere(
                                  (e) => e.id == provinces[index].id);
                            } else {
                              listSelect.add(provinces[index]);
                            }
                          });
                        } else {
                          if (isWard) {
                            selectWard(index);
                          } else if (isDistrict) {
                            selectDistrict(index);
                          } else {
                            selectProvince(index);
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
                                    isWard
                                        ? wards[index].name
                                        : isDistrict
                                            ? districts[index].name
                                            : provinces[index].name,
                                    style: textBody.copyWith(
                                      color: titleColor,
                                    )),
                              ],
                            ),
                            Visibility(
                              visible: listSelect
                                  .map((e) => e.id)
                                  .toList()
                                  .contains(provinces[index].id),
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

  void _modalButtonAddress(BuildContext context) {
    showModalBottomSheet(
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
                    label,
                    style: textHeading,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                    Visibility(
                      visible: isMultiSelect,
                      child: InkWell(
                        onTap: () {
                          multiProvince!(listSelect);
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
    listSelect = [...multiProvinces];
    List<String> stringList =
        multiProvinces.map((province) => province.name).toList();
    return GestureDetector(
        onTap: readOnly
            ? null
            : () {
                unfocus(context);
                isWard
                    ? wards.isNotEmpty
                        ? _modalButtonAddress(context)
                        : null
                    : isDistrict
                        ? districts.isNotEmpty
                            ? _modalButtonAddress(context)
                            : null
                        : _modalButtonAddress(context);
              },
        child: FormField(
          validator: validator,
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
                  errorText: isWard
                      ? errorWard.isNotEmpty
                          ? errorWard
                          : null
                      : isDistrict
                          ? errorDistrict.isNotEmpty
                              ? errorDistrict
                              : null
                          : errorProvince.isNotEmpty
                              ? errorProvince
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
                  isMultiSelect
                      ? multiProvinces.isNotEmpty
                          ? stringList.join(', ')
                          : 'Chọn Tỉnh/Thành phố'
                      : isWard
                          ? ward != null
                              ? ward!.name
                              : 'Chọn Phường/Xã/Thị trấn'
                          : isDistrict
                              ? district != null
                                  ? district!.name
                                  : 'Chọn Quận/Huyện'
                              : province != null
                                  ? province!.name
                                  : 'Chọn Tỉnh/Thành phố',
                  style: textBody.copyWith(
                      color: readOnly
                          ? greyText
                          : isWard
                              ? wards.isNotEmpty
                                  ? titleColor
                                  : borderColor
                              : isDistrict
                                  ? districts.isNotEmpty
                                      ? titleColor
                                      : borderColor
                                  : titleColor),
                  maxLines: 100,
                  overflow: TextOverflow.ellipsis,
                ));
          },
        ));
  }

  Widget searchAddress() {
    final TextEditingController controller = TextEditingController();
    return Padding(
      padding: EdgeInsets.all(kDefaultPaddingWidthScreen),
      child: TextFormField(
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
              onPressed: () {
                controller.clear();
              },
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
