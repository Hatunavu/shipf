import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shipf/data/model/auth/auth.dart';
import 'package:shipf/enums/enum_role.dart';

part 'app_state.freezed.dart';

@immutable
@freezed
class AppState with _$AppState {
  const factory AppState({
    LoginDataUser? user,
    required String languageCode,
    RoleType? role,
  }) = _AppState;
  factory AppState.initial() => const AppState(user: null, languageCode: '');
}
