import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/screen/shipper/bill_shipper/cubit/bill_shipper_state.dart';

class BillShipperCubit extends Cubit<BillShipperState> {
  BillShipperCubit() : super(BillShipperState.initial());

  Future<void> getShipments() async {
    try {
      emit(state.copyWith(isFirstLoad: true));
      final response = await mainRepository.getShipments();
      emit(state.copyWith(isFirstLoad: false, listOrder: response.data));
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isFirstLoad: false, error: errorMessage));
    }
  }
}
