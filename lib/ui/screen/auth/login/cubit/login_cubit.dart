import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/enums/enum_role.dart';
import 'package:shipf/ui/app_cubit.dart';
import 'package:shipf/ui/screen/auth/login/cubit/login_state.dart';

const homePageAssets = "assets/data/homepage.json";

class LoginCubit extends Cubit<LoginState> {
  final MainRepository mainRepository;
  final AppCubit appCubit;
  LoginCubit(this.mainRepository, this.appCubit) : super(LoginState.initial());

  void updateError(String error) {
    emit(state.copyWith(error: error));
  }

  void updateRole(RoleType role) {
    emit(state.copyWith(role: role));
  }

  void updateAgreeTerms() {
    emit(state.copyWith(isAgreeTerms: !state.isAgreeTerms));
  }

  Future<bool> sendPhone(String phone) async {
    emit(state.copyWith(isLoading: true));
    final isLogin = phone == '0987654321';
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(isLoading: false));
    return isLogin;
  }
}
