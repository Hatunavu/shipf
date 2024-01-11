import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/model/order/order.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/enums/enum_shipment_status.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/cubit/home_shipper_state.dart';

const homePageAssets = "assets/data/homepage.json";

class HomeShipperCubit extends Cubit<HomeShipperState> {
  HomeShipperCubit() : super(HomeShipperState.initial());

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
