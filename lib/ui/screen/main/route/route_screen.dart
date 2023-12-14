import 'package:flutter/material.dart';
import 'package:shipf/ui/shared/base_screen.dart';

class RouteScreen extends StatefulWidget {
  RouteScreen({Key? key}) : super(key: key);

  @override
  State<RouteScreen> createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      child: Center(child: Text("Tính năng đang được phát triển")),
    );
  }
}
