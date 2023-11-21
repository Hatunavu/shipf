import 'package:flutter_bloc/flutter_bloc.dart';
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

  Future<String> sendPass(String pass) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 2));
    if (pass == '111111') {
      emit(state.copyWith(isLoading: false));
      return '';
    } else {
      emit(state.copyWith(isLoading: false, error: 'Mật khẩu không đúng'));
      return 'Mật khẩu không đúng';
    }
  }
}
