import 'package:flutter/material.dart';
import 'package:shipf/ui/shared/base_screen.dart';

class UpdateInfoScreen extends StatelessWidget {
  const UpdateInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Cập nhật thông tin',
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      child: Center(child: Text("Tính năng đang được phát triển")),
    );
  }
}
