import 'package:flutter/material.dart';

class VerticalSpace extends StatelessWidget {
  final double value;
  final Color? color;

  const VerticalSpace(this.value, {Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return color != null
        ? Container(
            color: color,
            height: value,
          )
        : SizedBox(
            height: value,
          );
  }
}
