import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/services/account_services.dart';
import 'package:shipf/ui/shared/base_screen.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
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
