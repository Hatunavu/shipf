import 'package:freezed_annotation/freezed_annotation.dart';

part 'forget_pass_state.freezed.dart';

@freezed
class ForgetPassState with _$ForgetPassState {
  const factory ForgetPassState({
    required bool isLoading,
    required String error,
    required bool showPass,
    required bool showConfirmPass,
  }) = _ForgetPassState;

  factory ForgetPassState.initial() => const ForgetPassState(
      isLoading: false, error: "", showPass: false, showConfirmPass: false);
}
