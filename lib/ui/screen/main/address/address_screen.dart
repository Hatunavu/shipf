import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/shared/base_screen.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';

class AddressScreen extends StatefulWidget {
  AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: PrimaryButton(
            label: 'Thêm địa chỉ',
            onPressed: () {
              context.router.push(AddAddressPage());
            },
          ),
        ),
      ),
    );
  }
}
