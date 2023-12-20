import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';
import 'package:shipf/ui/theme/constant.dart';

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
              Text('Đặt hàng thành công'),
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
