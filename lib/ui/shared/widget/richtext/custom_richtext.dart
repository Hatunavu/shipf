import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class CustomRichtext extends StatelessWidget {
  final String textSpan1;
  final String textSpan2;
  final dynamic widgetNavigator;
  final bool isAuth;
  final double? fontSize;
  final Function()? onTap;

  const CustomRichtext(
      {Key? key,
      required this.textSpan1,
      required this.textSpan2,
      this.widgetNavigator,
      this.fontSize,
      this.isAuth = true,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isAuth
          ? RichText(
              text: TextSpan(style: primarySubTitleStyle, children: [
              TextSpan(text: textSpan1),
              TextSpan(
                  text: textSpan2,
                  recognizer: TapGestureRecognizer()
                    ..onTap = onTap ??
                        () {
                          context.router.push(widgetNavigator);
                        },
                  style: primarySubTitleStyle.copyWith(
                    color: primaryColor,
                  ))
            ]))
          : RichText(
              text: TextSpan(children: [
              TextSpan(text: textSpan1 + ' ', style: primarySubTitleStyle),
              TextSpan(
                  text: textSpan2,
                  style:
                      TextStyle(color: greyText, fontSize: fontSize ?? 11.sp))
            ])),
    );
  }
}
