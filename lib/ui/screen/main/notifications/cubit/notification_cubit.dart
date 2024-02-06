import 'package:bloc/bloc.dart';
import 'package:shipf/ui/screen/main/notifications/cubit/notification_state.dart';
import 'package:shipf/ui/services/account_services.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationState.initial());

  Future getNotificationToken() async {
    final deviceToken = await AccountServices().getNotificationToken();
    emit(state.copyWith(deviceToken: deviceToken));
  }
}
