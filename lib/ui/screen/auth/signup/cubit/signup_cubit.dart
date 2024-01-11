import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/model/auth/auth.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/enums/enum_role.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/screen/auth/signup/cubit/signup_state.dart';
import 'package:shipf/ui/shared/widget/toast_util.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupState.initial());

  void updateError(String error) {
    emit(state.copyWith(error: error));
  }

  void showPass() {
    emit(state.copyWith(showPass: !state.showPass));
  }

  Future<bool> register(RegisterRequest registerRequest) async {
    try {
      emit(state.copyWith(isLoading: true));
      final RegisterResponse response;
      if (state.role == RoleType.shipper) {
        response = await mainRepository.registerShipper(registerRequest);
      } else if (state.role == RoleType.business) {
        response = await mainRepository.registerBusiness(registerRequest);
      } else {
        response = await mainRepository.registerCustomer(registerRequest);
      }
      ToastUtils.showSuccess(response.message);
      emit(state.copyWith(isLoading: false));
      return true;
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
      return false;
    }
  }

  void updateRole(RoleType role) {
    emit(state.copyWith(role: role));
  }

  void updateAgreeTerms() {
    emit(state.copyWith(isAgreeTerms: !state.isAgreeTerms));
  }
}
