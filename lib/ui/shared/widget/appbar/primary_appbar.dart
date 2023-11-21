import 'package:flutter/material.dart';

PreferredSizeWidget primaryAppBar(
    {required BuildContext context,
    required String title,
    bool isUpdate = false,
    bool isBack = true}) {
  return AppBar(
    backgroundColor: isUpdate ? Colors.black : Colors.transparent,
    centerTitle: true,
    elevation: 0,
    // title: Text(
    //   title,
    //   style: primaryHeaderTitleStyle.copyWith(
    //       color: isUpdate ? Colors.white : Colors.black),
    // ),
    leading: isBack
        ? InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: isUpdate ? Colors.white : Colors.black,
            ),
          )
        : null,
  );
}
