import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/ui/screen/main/system/cubit/system_state.dart';

class SystemCubit extends Cubit<SystemState> {
  SystemCubit() : super(SystemState.initial());
}
