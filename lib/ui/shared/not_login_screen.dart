import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/shared/base_screen.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';
import 'package:shipf/ui/theme/text_style.dart';

class NotLoginScreen extends StatelessWidget {
  const NotLoginScreen(
      {Key? key,
      required this.title,
      required this.description,
      this.isLeading = false})
      : super(key: key);
  final String title;
  final String description;
  final bool? isLeading;
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: title,
      leading: isLeading == true
          ? InkWell(
              onTap: () {
                context.router.pop();
              },
              child: Icon(
                Ionicons.chevron_back_outline,
                size: 21.sp,
                color: Colors.white,
              ))
          : null,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 230.h,
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        description,
                        textAlign: TextAlign.center,
                        style: primaryTitleStyle.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            height: 1.3),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      PrimaryButton(
                        onPressed: () {
                          // context.router.push(MainPage());
                          context.router.replace(MainPage());
                        },
                        label: "Đăng nhập ngay",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
