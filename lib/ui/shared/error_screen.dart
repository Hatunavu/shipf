import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';
import 'package:shipf/ui/theme/constant.dart';

class ErrorScreen extends StatelessWidget {
  final String error;
  final Widget? errorWidget;
  final bool hasAction;
  final String? actionTitle;
  final void Function()? onTapped;

  const ErrorScreen({
    Key? key,
    required this.error,
    this.errorWidget,
    this.hasAction = false,
    this.onTapped,
    this.actionTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 32.h,
        horizontal: 32.w,
      ),
      child: Center(
        child: Column(
          children: [
            // Padding(
            //   padding: EdgeInsets.only(right: 16.w),
            //   child: errorWidget ??
            //       SvgPicture.asset(
            //         AppPath.logoSvg,
            //         color: Colors.black,
            //         width: 160.w,
            //       ),
            // ),
            SizedBox(height: 42.h),
            Text(
              error,
              style: TextStyle(
                color: primaryColor,
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            Container(
              padding: EdgeInsets.zero,
              height: 32.h,
              width: 140.w,
              child: hasAction
                  ? PrimaryButton(
                      backgroundColor: primaryColor,
                      label: "Thử lại",
                      onPressed: onTapped,
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
