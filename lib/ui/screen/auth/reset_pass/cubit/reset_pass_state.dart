import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_pass_state.freezed.dart';

@freezed
class ResetPassState with _$ResetPassState {
  const factory ResetPassState({
    required bool isLoading,
    required String error,
    required bool showPass,
    required bool showConfirmPass,
  }) = _ResetPassState;

  factory ResetPassState.initial() => const ResetPassState(
      isLoading: false, error: "", showPass: false, showConfirmPass: false);
}
