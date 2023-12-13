import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shipf/enums/enum_role.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/theme/constant.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Ionicons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Ionicons.settings_outline))
        ],
        title: Text('ShipF'),
        centerTitle: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text("Trang chủ ${appCubit.state.role.display()}")),
        ],
      ),
    );
  }
}
