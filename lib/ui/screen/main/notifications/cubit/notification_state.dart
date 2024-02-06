import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_state.freezed.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState({
    required bool isLoading,
    String? error,
    required String deviceToken,
  }) = _NotificationState;

  factory NotificationState.initial() =>
      const NotificationState(isLoading: false, error: "", deviceToken: '');
}
