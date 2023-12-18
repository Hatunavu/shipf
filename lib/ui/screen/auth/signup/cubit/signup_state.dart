import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shipf/enums/enum_role.dart';

part 'signup_state.freezed.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState({
    required bool isLoading,
    required String error,
    required bool showPass,
    required RoleType role,
    required bool isAgreeTerms,
  }) = _SignupState;

  factory SignupState.initial() => const SignupState(
        isLoading: false,
        error: "",
        showPass: false,
        role: RoleType.customer,
        isAgreeTerms: true,
      );
}
