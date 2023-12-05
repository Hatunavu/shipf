import 'package:freezed_annotation/freezed_annotation.dart';

part 'enter_pass_state.freezed.dart';

@freezed
class EnterPassState with _$EnterPassState {
  const factory EnterPassState({
    required bool isLoading,
    required String error,
    required bool showPass,
  }) = _EnterPassState;

  factory EnterPassState.initial() =>
      const EnterPassState(isLoading: false, error: "", showPass: false);
}
