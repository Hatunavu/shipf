import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shipf/enums/enum_weight_unit.dart';
import 'package:shipf/ui/shared/utils/functions.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class SelectUnitWidget extends StatelessWidget {
  final Function(WeightUnitType unit) selectUnit;
  final WeightUnitType unit;

  SelectUnitWidget(
      {super.key, required this.selectUnit, this.unit = WeightUnitType.ton});
  final List<WeightUnitType> listUnit = [
    WeightUnitType.kg,
    WeightUnitType.ton,
    WeightUnitType.box,
    WeightUnitType.cube,
    WeightUnitType.package
  ];
  Widget setupAlertDialogContainer() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: listUnit.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  visualDensity:
                      const VisualDensity(horizontal: 0, vertical: -4),
                  title: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      selectUnit(listUnit[index]);
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: kDefaultPaddingWidthScreen,
                          vertical: kDefaultPaddingHeightScreen),
                      child: Row(
                        children: [
                          const Icon(
                            Ionicons.cube,
                            color: primaryColor,
                          ),
                          SizedBox(
                            width: kDefaultPaddingWidthScreen,
                          ),
                          Text(listUnit[index].display(),
                              style: textBody.copyWith(
                                color: titleColor,
                              )),
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
  }

  void _modalButtonUnit(BuildContext context) {
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
                    'Đơn vị',
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
            SizedBox(height: 0.55.sh, child: setupAlertDialogContainer()),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
      unfocus(context);
      _modalButtonUnit(context);
    }, child: FormField(
      builder: (FormFieldState<String> state) {
        return InputDecorator(
            decoration: InputDecoration(
              filled: true,
              fillColor: backgroundTextField,
              labelStyle: textBody,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: kDefaultPaddingWidthWidget),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(secondaryBorderRadius)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(secondaryBorderRadius)),
            ),
            child: Text(
              unit.display(),
              style: textBody.copyWith(color: titleColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ));
      },
    ));
  }
}
