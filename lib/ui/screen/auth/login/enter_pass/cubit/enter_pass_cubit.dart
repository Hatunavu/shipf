import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/model/auth/auth.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/ui/app_cubit.dart';
import 'package:shipf/ui/screen/auth/login/enter_pass/cubit/enter_pass_state.dart';

const homePageAssets = "assets/data/homepage.json";

class EnterPassCubit extends Cubit<EnterPassState> {
  final MainRepository mainRepository;
  final AppCubit appCubit;
  EnterPassCubit(this.mainRepository, this.appCubit)
      : super(EnterPassState.initial());

  void updateError(String error) {
    emit(state.copyWith(error: error));
  }

  void showPass() {
    emit(state.copyWith(showPass: !state.showPass));
  }

  Future<String> sendPass(LoginRequest loginRequest) async {
    try {
      emit(state.copyWith(isLoading: true));
      await mainRepository.login(loginRequest);
      emit(state.copyWith(isLoading: false));
      return '';
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
      return "Mật khẩu không đúng";
    }
    // catch (e) {
    //   emit(state.copyWith(isLoading: false, error: "Mật khẩu không đúng"));
    //   return "Mật khẩu không đúng";
    // }
  }
}
