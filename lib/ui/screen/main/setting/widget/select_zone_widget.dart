// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shipf/data/model/account/account_model.dart';
import 'package:shipf/ui/shared/utils/functions.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class SelectZoneWidget extends StatefulWidget {
  final String label;
  final bool isDeliver;
  final List<AccountZone> zones;
  final String errorZone;
  final String? Function(String?)? validator;
  final Function(List<AccountZone> provinces)? multiZone;
  final List<AccountZone> multiZones;

  SelectZoneWidget({
    Key? key,
    required this.label,
    this.isDeliver = false,
    this.zones = const [],
    this.errorZone = '',
    this.multiZone,
    this.multiZones = const [],
    this.validator,
  }) : super(key: key);

  @override
  State<SelectZoneWidget> createState() => _SelectZoneWidgetState();
}

class _SelectZoneWidgetState extends State<SelectZoneWidget> {
  List<AccountZone> listSelect = [];
  late TextEditingController controller;
  List<AccountZone> resultZones = [];

  @override
  void initState() {
    resultZones = [...widget.zones];
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
                resultZones = [...widget.zones];
              });
              controller.clear();
            },
            onChanged: (value) {
              setState(() {
                resultZones.clear();
                for (var zone in widget.zones) {
                  if (zone.fullAddress
                      .toLowerCase()
                      .contains(value.toLowerCase())) {
                    setState(() {
                      resultZones.add(zone);
                    });
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
                itemCount: resultZones.length,
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
                        setState(() {
                          if (listSelect
                              .map((e) => e.id)
                              .toList()
                              .contains(resultZones[index].id)) {
                            listSelect.removeWhere(
                                (e) => e.id == resultZones[index].id);
                          } else {
                            listSelect.add(resultZones[index]);
                          }
                        });
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
                                Text(resultZones[index].fullAddress,
                                    style: textBody.copyWith(
                                      color: titleColor,
                                    )),
                              ],
                            ),
                            Visibility(
                              visible: listSelect
                                  .map((e) => e.id)
                                  .toList()
                                  .contains(resultZones[index].id),
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
                        setState(() {
                          resultZones = [...widget.zones];
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
                    InkWell(
                      onTap: () {
                        controller.clear();
                        widget.multiZone!(listSelect);
                        setState(() {
                          resultZones = [...widget.zones];
                        });
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        height: 50.h,
                        width: 0.1.sw,
                        child: const Icon(
                          Icons.done,
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
    listSelect = [...widget.multiZones];
    List<String> stringList =
        widget.multiZones.map((zone) => zone.fullAddress).toList();
    return GestureDetector(
        onTap: () {
          unfocus(context);
          _modalButtonAddress(
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
                  errorText:
                      widget.errorZone.isNotEmpty ? widget.errorZone : null,
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
                  widget.multiZones.isNotEmpty
                      ? stringList.join('; ')
                      : 'Chọn khu vực',
                  style: textBody.copyWith(color: titleColor),
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
