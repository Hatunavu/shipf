import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shipf/data/model/user_session/user_session.dart';
import 'package:shipf/enums/enum_role.dart';

part 'app_state.freezed.dart';

@immutable
@freezed
class AppState with _$AppState {
  const factory AppState({
    UserSession? userSession,
    required String languageCode,
    required RoleType role,
  }) = _AppState;
  factory AppState.initial() => const AppState(
      userSession: null, languageCode: '', role: RoleType.customer);
}
