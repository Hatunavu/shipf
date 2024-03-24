import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/model/auth/auth.dart';
import 'package:shipf/enums/enum_role.dart';
import 'package:shipf/ui/app_state.dart';
import 'package:shipf/ui/services/account_services.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState.initial());

  Future getInitRole() async {
    final RoleType role =
        stringToRoleType(await AccountServices().getAccountType());
    emit(state.copyWith(role: role));
  }

  void updateUserSession(LoginDataUser? user) {
    emit(state.copyWith(user: user));
  }

  void updateLanguage(String languageCode) {
    emit(state.copyWith(languageCode: languageCode));
  }

  void updateRole(RoleType role) {
    AccountServices().saveAccountType(roleTypeToString(role));
    emit(state.copyWith(role: role));
  }
}
