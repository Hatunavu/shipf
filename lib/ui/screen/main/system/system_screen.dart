import 'package:flutter/material.dart';

import 'package:shipf/ui/shared/base_screen.dart';

class SystemScreen extends StatefulWidget {
  SystemScreen({Key? key}) : super(key: key);

  @override
  State<SystemScreen> createState() => _SystemScreenState();
}

class _SystemScreenState extends State<SystemScreen> {
  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      child: Text("hệ thống"),
    );
  }
}
