import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/ui/theme/constant.dart';

TextStyle get primaryHeaderTitleStyle {
  return TextStyle(
      fontSize: 18.sp,
      color: Colors.black,
      fontWeight: FontWeight.w500,
      height: 1.3);
}

TextStyle get primaryTitleStyle {
  return TextStyle(
      fontSize: 14.sp, color: Colors.black, fontWeight: FontWeight.w500);
}

TextStyle get primarySubTitleStyle {
  return TextStyle(
      fontSize: 12.sp, color: Colors.grey[500], fontWeight: FontWeight.w400);
}

TextStyle get textTitle {
  return TextStyle(
      fontSize: 25.sp, fontWeight: FontWeight.w600, color: titleColor);
}

TextStyle get textHeading {
  return TextStyle(
      fontSize: 16.sp, fontWeight: FontWeight.w600, color: titleColor);
}

TextStyle get textBody {
  return TextStyle(
      fontWeight: FontWeight.w400, fontSize: 14.sp, color: contentColor);
}

TextStyle get textButtonPrimary {
  return TextStyle(
      fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.white);
}
