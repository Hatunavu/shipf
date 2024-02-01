import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shipf/data/model/address/address.dart';
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

  const SelectAddressWidget(
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
      this.readOnly = false})
      : super(key: key);

  Widget setupAlertDialogContainer() {
    return ListView.builder(
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
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          title: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              if (isWard) {
                selectWard(index);
              } else if (isDistrict) {
                selectDistrict(index);
              } else {
                selectProvince(index);
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
            ),
          ),
        );
      },
    );
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
            SizedBox(height: 0.5.sh, child: setupAlertDialogContainer()),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: readOnly
            ? null
            : () {
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
                  isWard
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
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ));
          },
        ));
  }
}
