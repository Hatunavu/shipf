import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/ui/screen/main/notifications/cubit/notification_cubit.dart';
import 'package:shipf/ui/screen/main/notifications/cubit/notification_state.dart';
import 'package:shipf/ui/shared/base_screen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late NotificationCubit notificationCubit;
    return BlocProvider(
      create: (context) => NotificationCubit(),
      child: BlocConsumer<NotificationCubit, NotificationState>(
        listener: (context, state) {},
        builder: (context, state) {
          notificationCubit = context.read<NotificationCubit>();
          return BaseScreen(
            title: 'Thông báo',
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
                child: GestureDetector(
                    onDoubleTap: () {
                      notificationCubit.getNotificationToken();
                    },
                    child: state.deviceToken.isNotEmpty
                        ? SelectableText(state.deviceToken)
                        : const Text("Tính năng đang được phát triển"))),
          );
        },
      ),
    );
  }
}
