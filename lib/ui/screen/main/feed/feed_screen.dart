import 'package:flutter/material.dart';

import 'package:shipf/ui/shared/base_screen.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      child: Text("bảng tin"),
    );
  }
}
