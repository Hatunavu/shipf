import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen(
      {Key? key,
      this.title,
      this.leading,
      this.trailing,
      required this.child,
      this.elevation = 0.5,
      this.onPress,
      this.titleWidget,
      this.floatingActionButton,
      this.backgroundColor,
      this.titleColor})
      : super(key: key);

  final String? title;
  final List<Widget>? trailing;
  final Widget? leading;
  final Widget child;
  final double? elevation;
  final Function()? onPress;
  final Widget? titleWidget;
  final Widget? floatingActionButton;
  final Color? backgroundColor;
  final Color? titleColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      resizeToAvoidBottomInset: true,
      appBar: title != null
          ? AppBar(
              backgroundColor: backgroundColor ?? Colors.white,
              actions: trailing,
              leading: leading,
              automaticallyImplyLeading: leading != null ? true : false,
              elevation: elevation,
              centerTitle: true,
              title: Text(title!,
                  style: primaryTitleStyle.copyWith(
                      color: primaryColor, fontSize: 18.sp)))
          : null,
      floatingActionButton: floatingActionButton,
      body: SafeArea(
        child: GestureDetector(
          child: child,
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
        ),
      ),
    );
  }
}
