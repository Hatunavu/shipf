import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/model/shipment/shipment_update_request.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/enums/enum_shipment_status.dart';
import 'package:shipf/enums/enum_shipment_update.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/shipment/cubit/shipments_state.dart';
import 'package:shipf/ui/shared/widget/toast_util.dart';

class ShipmentsCubit extends Cubit<ShipmentsState> {
  ShipmentsCubit() : super(ShipmentsState.initial());

  Future<void> getShipments({ShipmentStatus? shipmentStatus}) async {
    try {
      emit(state.copyWith(isFirstLoad: true));
      final response = await mainRepository.getShipments(
          shipmentStatusCode: shipmentStatus?.toJsonString());
      emit(state.copyWith(isFirstLoad: false, shipments: response.data));
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isFirstLoad: false, error: errorMessage));
    }
  }

  Future<void> updateShipmentStatus(
      {ShipmentUpdate? shipmentUpdate, required int shipmentId}) async {
    try {
      emit(state.copyWith(isLoading: true));
      await mainRepository.updateShipmentStatus(shipmentUpdateRequest: [
        ShipmentUpdateRequest(
            shipmentId: shipmentId, shipmentStatusCode: shipmentUpdate!)
      ]);
      final newShipments = [...state.shipments];
      final indexShipmentUpdate =
          newShipments.indexWhere((element) => element.id == shipmentId);
      newShipments.removeAt(indexShipmentUpdate);
      ToastUtils.showSuccess('Cập nhật trạng thái đơn thành công');
      emit(state.copyWith(isLoading: false, shipments: newShipments));
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }
}
