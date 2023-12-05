import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_state.freezed.dart';

@freezed
class VerifyState with _$VerifyState {
  const factory VerifyState({
    required bool isLoading,
    required String error,
  }) = _VerifyState;

  factory VerifyState.initial() => const VerifyState(
        isLoading: false,
        error: "",
      );
}
