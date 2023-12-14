import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_state.freezed.dart';

@freezed
class SettingState with _$SettingState {
  const factory SettingState({
    required bool isLoading,
    String? error,
  }) = _SettingState;

  factory SettingState.initial() => const SettingState(
        isLoading: false,
        error: "",
      );
}
