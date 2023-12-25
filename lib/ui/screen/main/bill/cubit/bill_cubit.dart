import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/screen/main/bill/cubit/bill_state.dart';

class BillCubit extends Cubit<BillState> {
  BillCubit() : super(BillState.initial());

  Future<void> getListOrder() async {
    try {
      emit(state.copyWith(isLoading: true));
      final response = await mainRepository.getListOrder();
      emit(state.copyWith(isLoading: false, listOrder: response.data));
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }
}
