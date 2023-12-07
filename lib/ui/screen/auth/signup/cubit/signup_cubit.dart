import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/model/auth/auth.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/screen/auth/signup/cubit/signup_state.dart';
import 'package:shipf/ui/services/account_services.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupState.initial());

  void updateError(String error) {
    emit(state.copyWith(error: error));
  }

  void showPass() {
    emit(state.copyWith(showPass: !state.showPass));
  }

  Future<bool> registerCustomer(RegisterRequest registerRequest) async {
    try {
      emit(state.copyWith(isLoading: true));
      await mainRepository.register(registerRequest);
      final response = await mainRepository.login(LoginRequest(
          phone: registerRequest.phone, password: registerRequest.password));
      AccountServices().saveUserToken(response.data?.accessToken ?? '');
      emit(state.copyWith(isLoading: false));
      return true;
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
      return false;
    }
  }

  Future<bool> registerBusiness(RegisterRequest registerRequest) async {
    try {
      emit(state.copyWith(isLoading: true));
      await mainRepository.registerBusiness(registerRequest);
      AccountServices().saveUserToken('token');
      emit(state.copyWith(isLoading: false));
      return true;
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
      return false;
    }
  }
}
