import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/model/auth/auth.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/ui/app_cubit.dart';
import 'package:shipf/ui/screen/auth/reset_pass/cubit/reset_pass_state.dart';

class ResetPassCubit extends Cubit<ResetPassState> {
  final MainRepository mainRepository;
  final AppCubit appCubit;
  ResetPassCubit(this.mainRepository, this.appCubit)
      : super(ResetPassState.initial());

  Future<bool> register(RegisterRequest registerRequest) async {
    try {
      emit(state.copyWith(isLoading: true));
      await mainRepository.register(registerRequest);
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
