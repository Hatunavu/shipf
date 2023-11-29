import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class OrderLabelTextFieldWidget extends StatelessWidget {
  final String label;
  const OrderLabelTextFieldWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPaddingWidthWidget, vertical: 5.h)
              .copyWith(top: 0),
          child: Text(
            label,
            style: primarySubTitleStyle,
          ),
        ),
      ],
    );
  }
}
