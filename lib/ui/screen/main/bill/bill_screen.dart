import 'package:flutter/material.dart';
import 'package:shipf/ui/shared/base_screen.dart';

class BillScreen extends StatefulWidget {
  BillScreen({Key? key}) : super(key: key);

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      child: Center(child: Text("Tính năng đang được phát triển")),
    );
  }
}
