import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/model/auth/auth.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/screen/auth/signup/screen/cubit/verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit() : super(VerifyState.initial());

  Future<bool> sendOtp(VerifyRequest verifyRequest) async {
    try {
      emit(state.copyWith(isLoading: true));
      await mainRepository.verifyOTP(verifyRequest);
      emit(state.copyWith(isLoading: false));
      return true;
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
      return false;
    }
  }

  void updateError(String error) {
    emit(state.copyWith(error: error));
  }
}
