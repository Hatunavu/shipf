import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/enums/enum_role.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/screen/main/setting/cubit/setting_state.dart';
import 'package:shipf/ui/services/account_services.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingState.initial());

  Future getUserInfo() async {
    try {
      emit(state.copyWith(isFirstLoad: true, isLoading: true));
      final response = await mainRepository.getUserInfo();
      emit(state.copyWith(isFirstLoad: false,isLoading: false, userInfo: response.data));
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(
          isFirstLoad: false, isLoading: false, error: errorMessage));
    }
  }

  Future<bool> deleteUser() async {
    try {
      emit(state.copyWith(isLoading: true));
      await mainRepository.deleteUser();
      AccountServices().saveUserToken('');
      appCubit.updateRole(RoleType.logout);
      emit(state.copyWith(isLoading: false));
      return true;
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
      return false;
    }
  }
}
