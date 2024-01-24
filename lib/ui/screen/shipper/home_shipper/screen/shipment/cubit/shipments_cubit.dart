import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/shipment/cubit/shipments_state.dart';

class ShipmentsCubit extends Cubit<ShipmentsState> {
  ShipmentsCubit() : super(ShipmentsState.initial());

  Future<void> getShipments() async {
    try {
      emit(state.copyWith(isLoading: true));
      final response = await mainRepository.getShipments();
      emit(state.copyWith(isLoading: false, shipments: response.data));
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }
}
