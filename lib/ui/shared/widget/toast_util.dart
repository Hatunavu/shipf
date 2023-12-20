// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shipf/ui/theme/constant.dart';

const Color toastSuccess = primaryColor;
const Color toastFailed = Colors.red;
const Color toastNeutral = greyText;
final double defaultFontSize = textSize;
const Color defaultTextColor = Colors.white;
const Color defaultNeutralTextColor = primaryColor;
const ToastGravity defaultPosition = ToastGravity.BOTTOM;
const Toast defaultLength = Toast.LENGTH_SHORT;
const defaultTimeinSecForIosWeb = 1;

mixin ToastUtils {
  static void showSuccess(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: defaultLength,
        gravity: defaultPosition,
        timeInSecForIosWeb: defaultTimeinSecForIosWeb,
        backgroundColor: toastSuccess,
        textColor: defaultTextColor,
        fontSize: defaultFontSize);
  }

  static void showFail(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: defaultLength,
        gravity: defaultPosition,
        timeInSecForIosWeb: defaultTimeinSecForIosWeb,
        backgroundColor: toastFailed,
        textColor: defaultTextColor,
        fontSize: defaultFontSize);
  }

  static void showNeutral(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: defaultLength,
        gravity: defaultPosition,
        timeInSecForIosWeb: defaultTimeinSecForIosWeb,
        backgroundColor: toastNeutral,
        textColor: defaultNeutralTextColor,
        fontSize: defaultFontSize);
  }
}
