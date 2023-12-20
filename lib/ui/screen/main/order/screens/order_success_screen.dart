import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';
import 'package:shipf/ui/shared/widget/space/vertical_space.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 0.4.sw,
                  height: 0.4.sw,
                  decoration: const BoxDecoration(
                      color: primaryColor, shape: BoxShape.circle),
                  child: Icon(
                    Icons.done,
                    size: 0.3.sw,
                    color: Colors.white,
                  )),
              VerticalSpace(kDefaultPaddingHeightWidget),
              Text(
                'Tạo đơn thành công',
                style: textTitle,
              ),
              VerticalSpace(kDefaultPaddingHeightWidget * 2),
              Padding(
                padding: EdgeInsets.all(kDefaultPaddingWidthScreen),
                child: PrimaryButton(
                  label: 'Màn hình chính',
                  onPressed: () => context.router.push(MainPage()),
                ),
              )
            ],
          ),
        ));
    ;
  }
}
