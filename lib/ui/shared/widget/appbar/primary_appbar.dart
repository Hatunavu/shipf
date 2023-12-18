import 'package:flutter/material.dart';
import 'package:shipf/ui/theme/text_style.dart';

PreferredSizeWidget primaryAppBar(
    {required BuildContext context,
    required String title,
    bool isBack = true}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    centerTitle: true,
    elevation: 0,
    title: Text(
      title,
      style: primaryHeaderTitleStyle.copyWith(color: Colors.black),
    ),
    leading: isBack
        ? InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          )
        : null,
  );
}
