import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/ui/app_cubit.dart';
import 'package:shipf/ui/screen/auth/signup/cubit/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final MainRepository mainRepository;
  final AppCubit appCubit;
  SignupCubit(this.mainRepository, this.appCubit)
      : super(SignupState.initial());
}
