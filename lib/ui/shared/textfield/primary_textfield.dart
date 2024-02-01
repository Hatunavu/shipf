// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';
import 'package:shipf/foundation/extension/string_formatting.dart';
import 'package:shipf/foundation/extension/validation.dart';
import 'package:shipf/ui/shared/utils/validation.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class PrimaryTextField extends StatelessWidget {
  final String label;
  final bool? isPass;
  final bool isEmail;
  final bool? isPhone;
  final bool isNumberKey;
  final String? hintText;
  final bool isName;
  final bool? isPrice;
  final bool? isDesc;
  final bool isAddress;
  final String errorText;
  final bool isSecondTextField;
  final TextEditingController controller;
  final int? maxLines;
  final String? customErrorText;
  final bool isValidate;
  final bool readOnly;
  final String? passConfirm;
  final int? lengthLimit;
  final String fieldRequire;
  final bool showPrefixIcon;
  final Function()? callBack;
  final Function()? showPass;

  PrimaryTextField(
      {Key? key,
      required this.label,
      this.isPass,
      required this.controller,
      this.isEmail = false,
      this.isPhone,
      this.errorText = '',
      this.hintText,
      this.isName = false,
      this.isPrice,
      this.isDesc,
      this.isAddress = false,
      this.isNumberKey = false,
      this.isSecondTextField = false,
      this.maxLines,
      this.customErrorText,
      this.isValidate = true,
      this.readOnly = false,
      this.passConfirm,
      this.lengthLimit,
      this.fieldRequire = '',
      this.showPrefixIcon = true,
      this.callBack,
      this.showPass})
      : super(key: key);

  final ValueNotifier _isShow = ValueNotifier(false);
  final ValueNotifier _isError = ValueNotifier(false);
  static const _locale = 'en';

  String _formatNumber(String s) => NumberFormat.decimalPattern(_locale)
      .format(int.parse(s.isEmpty ? '0' : s));

  String? validate(String? text) {
    if (isValidate) {
      if (isPhone == true) {
        if (text == null || text.isEmpty) {
          return 'Vui lòng nhập số điện thoại';
        } else if (text.formatPhoneNumber().isValidPhone == false) {
          return "Số điện thoại không đúng định dạng";
        }
      }
      if (passConfirm != null) {
        if (text != passConfirm) {
          return 'Mật khẩu không khớp';
        }
      }
      if (isPass != null) {
        if (text == null || text.isEmpty || !StringX(text).isValidPassword()) {
          return 'Mật khẩu phải từ 6 ký tự';
        }
      }
      if (isEmail) {
        if (text == null || text.isEmpty) {
          return 'Vui lòng nhập Email';
        } else if (!StringX(text).isEmail()) {
          return 'Email không đúng định dạng';
        }
      }
      if (text == null || text.isEmpty) {
        return "Vui lòng nhập $fieldRequire";
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _isShow,
        builder: (context, value, _) {
          return ValueListenableBuilder(
              valueListenable: _isError,
              builder: (context, value, _) {
                return TextFormField(
                  inputFormatters: <TextInputFormatter>[
                    LengthLimitingTextInputFormatter(lengthLimit),
                  ],
                  maxLines: isPass != null ? 1 : maxLines,
                  enableSuggestions: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  autofillHints: const [AutofillHints.oneTimeCode],
                  validator: (text) => validate(text),
                  readOnly: readOnly,
                  controller: controller,
                  obscureText: isPass != null ? !isPass! : false,
                  style: primaryTitleStyle.copyWith(
                      color: readOnly ? greyText : Colors.black,
                      height: 1.3,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal),
                  keyboardType: isPhone == true || isNumberKey
                      ? const TextInputType.numberWithOptions()
                      : TextInputType.text,
                  onChanged: isPrice == true
                      ? (string) {
                          string = _formatNumber(string.replaceAll(',', ''));
                          controller.value = TextEditingValue(
                            text: string,
                            selection:
                                TextSelection.collapsed(offset: string.length),
                          );
                        }
                      : null,
                  onTap: callBack,
                  decoration: InputDecoration(
                    errorText:
                        isValidate && errorText.isNotEmpty ? errorText : null,
                    filled: true,
                    fillColor: backgroundTextField,
                    errorStyle: TextStyle(fontSize: 10.sp, color: Colors.red),
                    hintText: hintText ?? '',
                    hintStyle: primaryTitleStyle.copyWith(color: greyText),
                    suffixIcon: isPass != null
                        ? IconButton(
                            onPressed: showPass,
                            icon: Icon(
                              isPass == true ? Ionicons.eye : Ionicons.eye_off,
                              size: 18.sp,
                              color: primaryColor,
                            ))
                        : null,
                    prefixIcon: (isPhone == true && showPrefixIcon)
                        ? Icon(
                            Ionicons.call_outline,
                            size: 18.sp,
                            color: primaryColor,
                          )
                        : isPass != null
                            ? Icon(
                                Ionicons.lock_closed_outline,
                                size: 18.sp,
                                color: primaryColor,
                              )
                            : isEmail == true
                                ? Icon(
                                    Ionicons.mail_outline,
                                    size: 18.sp,
                                    color: primaryColor,
                                  )
                                : isName
                                    ? Icon(
                                        Ionicons.person_outline,
                                        size: 18.sp,
                                        color: primaryColor,
                                      )
                                    : null,
                    labelStyle: primaryTitleStyle.copyWith(
                        color: primaryColor, fontWeight: FontWeight.w400),
                    floatingLabelStyle:
                        primaryTitleStyle.copyWith(color: primaryColor),
                    errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(
                            isSecondTextField ? defaultBorderRadius : 20.r)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(
                            isSecondTextField ? defaultBorderRadius : 20.r)),
                    contentPadding: EdgeInsets.only(
                        top: 10.h, bottom: 10.h, left: 16.w, right: 16.w),
                    enabledBorder: OutlineInputBorder(
                        borderSide: isSecondTextField
                            ? const BorderSide(color: greyText)
                            : BorderSide.none,
                        borderRadius: BorderRadius.circular(
                            isSecondTextField ? defaultBorderRadius : 20.r)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: isSecondTextField
                            ? const BorderSide(color: greyText)
                            : BorderSide.none,
                        borderRadius: BorderRadius.circular(
                            isSecondTextField ? defaultBorderRadius : 20.r)),
                  ),
                );
              });
        });
  }
}
