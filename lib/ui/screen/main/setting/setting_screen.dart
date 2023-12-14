import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/services/account_services.dart';
import 'package:shipf/ui/shared/base_screen.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: '',
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      child: Center(
        child: PrimaryButton(
          label: 'Đăng xuất',
          maxWidth: 0.5.sw,
          onPressed: () {
            AccountServices().saveUserToken('');
            context.router.push(LoginPage());
          },
        ),
      ),
    );
  }
}
