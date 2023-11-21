import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_pass_state.freezed.dart';

@freezed
class ResetPassState with _$ResetPassState {
  const factory ResetPassState({
    required bool isLoading,
    String? error,
  }) = _ResetPassState;

  factory ResetPassState.initial() =>
      const ResetPassState(isLoading: false, error: "");
}
