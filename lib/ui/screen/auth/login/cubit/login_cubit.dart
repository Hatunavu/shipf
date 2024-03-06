import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/model/auth/auth.dart';
import 'package:shipf/data/model/token/token_request.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/enums/enum_role.dart';
import 'package:shipf/ui/app_cubit.dart';
import 'package:shipf/ui/screen/auth/login/cubit/login_state.dart';
import 'package:shipf/ui/services/account_services.dart';

class LoginCubit extends Cubit<LoginState> {
  final MainRepository mainRepository;
  final AppCubit appCubit;
  LoginCubit(this.mainRepository, this.appCubit) : super(LoginState.initial());

  void updateError(String error) {
    emit(state.copyWith(error: error));
  }

  void updateAgreeTerms() {
    emit(state.copyWith(isAgreeTerms: !state.isAgreeTerms));
  }

  Future<bool?> sendPhone(String phone) async {
    try {
      emit(state.copyWith(isLoading: true));
      final response =
          await mainRepository.verifyPhone(VerifyRequest(phone: phone));
      if (response.success) {
        emit(state.copyWith(isLoading: false));
        return false;
      }
    } on DioError catch (e) {
      final statusCode = e.response?.statusCode ?? 0;
      if (statusCode == 409) {
        emit(state.copyWith(isLoading: false));
        return true;
      } else {
        final errorMessage = mainRepository.mapDioErrorToMessage(e);
        emit(state.copyWith(isLoading: false, error: errorMessage));
      }
    }
    return null;
  }

  void showPass() {
    emit(state.copyWith(showPass: !state.showPass));
  }

  Future<bool> login(LoginRequest loginRequest) async {
    try {
      emit(state.copyWith(isLoading: true));
      final response = await mainRepository.login(loginRequest);
      AccountServices().saveUserToken(response.data?.accessToken ?? '');
      AccountServices().saveAccountType(
          response.data?.user?.roles.first.roleType.toJsonString() ?? '');
      appCubit.updateRole(
          response.data?.user?.roles.first.roleType ?? RoleType.logout);
      final notificationToken = await AccountServices().getNotificationToken();
      await mainRepository.sendDeviceToken(
          tokenRequest: TokenRequest(token: notificationToken));
      emit(state.copyWith(isLoading: false));
      return true;
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
      return false;
    }
  }
}
