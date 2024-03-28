import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/model/auth/auth.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/screen/auth/forget_pass/cubit/forget_pass_state.dart';
import 'package:shipf/ui/shared/widget/toast_util.dart';

class ForgetPassCubit extends Cubit<ForgetPassState> {
  ForgetPassCubit() : super(ForgetPassState.initial());

  Future<bool> submit(ForgetPassRequest forgetPassRequest) async {
    try {
      emit(state.copyWith(isLoading: true));
      await mainRepository.forgetPass(forgetPassRequest);
      emit(state.copyWith(isLoading: false));
      ToastUtils.showSuccess('Cập nhật mật khẩu thành công');

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

  void showPass() {
    emit(state.copyWith(showPass: !state.showPass));
  }

  void showConfirmPass() {
    emit(state.copyWith(showConfirmPass: !state.showConfirmPass));
  }
}
