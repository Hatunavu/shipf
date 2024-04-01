import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/model/order/order.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/enums/enum_loading_type.dart';
import 'package:shipf/enums/enum_shipment_status.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/cubit/home_shipper_state.dart';

class HomeShipperCubit extends Cubit<HomeShipperState> {
  HomeShipperCubit() : super(HomeShipperState.initial());

  Future<void> init() async {
    try {
      emit(state.copyWith(isLoading: true));
      await getData();

      emit(state.copyWith(isLoading: false));
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }

  Future<void> getData() async {
    final analysis = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    try {
      final transitSummary = await mainRepository.getTransitSummary();
      final shipmentSummary = await mainRepository.getShipmentSummary();
      analysis[0] = transitSummary
          .data[transitSummary.data
              .indexWhere((element) => element.type == LoadingType.pickup)]
          .totalElements;
      analysis[1] = transitSummary
          .data[transitSummary.data
              .indexWhere((element) => element.type == LoadingType.delivery)]
          .totalElements;
      analysis[2] = transitSummary
          .data[transitSummary.data
              .indexWhere((element) => element.type == LoadingType.transit)]
          .totalElements;
      analysis[3] = shipmentSummary
          .data[shipmentSummary.data.indexWhere(
              (element) => element.shipmentStatus == ShipmentStatus.pickingUp)]
          .totalElements;
      analysis[4] = shipmentSummary
          .data[shipmentSummary.data.indexWhere(
              (element) => element.shipmentStatus == ShipmentStatus.delivering)]
          .totalElements;
      analysis[5] = shipmentSummary
          .data[shipmentSummary.data.indexWhere(
              (element) => element.shipmentStatus == ShipmentStatus.transiting)]
          .totalElements;

      emit(state.copyWith(analysis: analysis));
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(error: errorMessage));
    }
  }

  Future<void> updateOrderStatus() async {
    try {
      emit(state.copyWith(isLoading: true));
      await mainRepository.updateOrderStatus(
          orderId: 14,
          updateOrderRequest: UpdateOrderStatusRequest(
              shipmentStatusCode: ShipmentStatus.pendingPickup, note: ''));
      emit(state.copyWith(isLoading: false));
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }
}
