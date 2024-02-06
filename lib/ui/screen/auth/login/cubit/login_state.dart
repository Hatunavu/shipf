import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required bool isLoading,
    required bool isAgreeTerms,
    required bool isLogin,
    required String error,
    required bool showPass,

  }) = _LoginState;

  factory LoginState.initial() => const LoginState(
      isLoading: false,
      error: "",
      isAgreeTerms: true,
      isLogin: false,
      showPass: false);
}
