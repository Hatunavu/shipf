import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState({
    required bool isLoading,
    String? error,
  }) = _SignupState;

  factory SignupState.initial() => const SignupState(
        isLoading: false,
        error: "",
      );
}
