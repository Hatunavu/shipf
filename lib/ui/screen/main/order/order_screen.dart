import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/shared/base_screen.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';

class OrderScreen extends StatefulWidget {
  OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: PrimaryButton(
            label: 'Địa chỉ',
            onPressed: () {
              context.router.push(AddressPage());
            },
          ),
        ),
      ),
    );
  }
}
