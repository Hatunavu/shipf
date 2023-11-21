import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/model/user_session/user_session.dart';
import 'package:shipf/enums/enum_role.dart';
import 'package:shipf/ui/app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState.initial());
  void updateUserSession(UserSession? userSession) {
    emit(state.copyWith(userSession: userSession));
  }

  void updateLanguage(String languageCode) {
    emit(state.copyWith(languageCode: languageCode));
  }

  void updateRole(RoleType role) {
    emit(state.copyWith(role: role));
  }
}
