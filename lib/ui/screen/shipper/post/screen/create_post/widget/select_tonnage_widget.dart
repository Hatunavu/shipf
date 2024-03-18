// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shipf/enums/enum_tonnage.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class SelectTonnageWidget extends StatelessWidget {
  final Function(List<TonnageType> tonnages) selectTonnages;
  List<TonnageType> tonnages;
  SelectTonnageWidget(
      {super.key, required this.selectTonnages, this.tonnages = const []});

  final List<TonnageType> listTonnage = [
    TonnageType.one,
    TonnageType.onePointFour,
    TonnageType.onePointNine,
    TonnageType.twoPointFive,
    TonnageType.threePointFive,
    TonnageType.five,
    TonnageType.seven
  ];

  List<TonnageType> listSelect = [];

  Widget setupAlertDialogContainer() {
    listSelect = [...tonnages];
    return StatefulBuilder(builder: (context, setState) {
      return Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: listTonnage.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    visualDensity:
                        const VisualDensity(horizontal: 0, vertical: -4),
                    title: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        setState(() {
                          if (listSelect.contains(listTonnage[index])) {
                            listSelect.remove(listTonnage[index]);
                          } else {
                            listSelect.add(listTonnage[index]);
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
                                  Ionicons.car,
                                  color: primaryColor,
                                ),
                                SizedBox(
                                  width: kDefaultPaddingWidthScreen,
                                ),
                                Text(listTonnage[index].display(),
                                    style: textBody.copyWith(
                                      color: titleColor,
                                    )),
                              ],
                            ),
                            Visibility(
                              visible: listSelect.contains(listTonnage[index]),
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

  void _modalButtonTonnage(BuildContext context) {
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
                    'Loại xe',
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
                    InkWell(
                      onTap: () {
                        selectTonnages(listSelect);
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
    List<String> stringList =
        tonnages.map((tonnage) => tonnage.display().split(', ').last).toList();
    return GestureDetector(onTap: () {
      _modalButtonTonnage(context);
    }, child: FormField(
      builder: (FormFieldState<String> state) {
        return InputDecorator(
            decoration: InputDecoration(
              filled: true,
              fillColor: backgroundTextField,
              labelStyle: textBody,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: kDefaultPaddingWidthWidget, vertical: 5.h),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(secondaryBorderRadius)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(secondaryBorderRadius)),
            ),
            child: Text(
              tonnages.isEmpty ? 'Chọn loại xe' : stringList.join(', '),
              style: textBody.copyWith(color: titleColor),
              maxLines: 3,
            ));
      },
    ));
  }
}
