import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/ui/screen/main/notifications/cubit/notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final MainRepository _apiClient;

  NotificationCubit(this._apiClient) : super(NotificationState.initial());
}
