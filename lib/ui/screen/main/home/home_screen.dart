import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shipf/enums/enum_role.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/shared/base_screen.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Trang chủ ${appCubit.state.role.display()}"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PrimaryButton(
              label: 'Tạo đơn',
              onPressed: () {
                context.router.push(OrderPage());
              },
            ),
          )
        ],
      ),
    );
  }
}
