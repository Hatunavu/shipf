import 'package:flutter/material.dart';
import 'package:shipf/enums/enum_role.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/shared/base_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Center(child: Text("Trang chủ ${appCubit.state.role.display()}")),
    );
  }
}
