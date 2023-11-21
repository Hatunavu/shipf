import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shipf/enums/enum_role.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required bool isLoading,
    required RoleType role,
    required bool isAgreeTerms,
    required bool isLogin,
    String? error,
  }) = _LoginState;

  factory LoginState.initial() => const LoginState(
      isLoading: false,
      error: "",
      role: RoleType.customer,
      isAgreeTerms: true,
      isLogin: false);
}
