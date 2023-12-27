import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shipf/data/model/account/account_model.dart';

part 'setting_state.freezed.dart';

@freezed
class SettingState with _$SettingState {
  const factory SettingState({
    required bool isLoading,
    required bool isFirstLoad,
    AccountData? userInfo,
    String? error,
  }) = _SettingState;

  factory SettingState.initial() => const SettingState(
        isLoading: false,
        isFirstLoad: false,
        error: "",
      );
}
