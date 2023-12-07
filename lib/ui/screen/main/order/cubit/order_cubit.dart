import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:shipf/data/model/order/order_request.dart';
import 'package:shipf/data/model/order/order_service.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/enums/enum_step_order.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/screen/main/order/cubit/order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderState.initial());

  Future init() async {
    List<OrderService> listService = [
      OrderService(
          id: 1,
          name: 'TV HN - Vùng 1 20kg',
          type: 'Giao ghép hàng',
          fee: '70.000đ'),
      OrderService(
          id: 2,
          name: 'TV HN - Vùng 1',
          type: 'Giao nguyên chuyến',
          fee: '1.000.000đ'),
      OrderService(
          id: 3,
          name: 'TV HN - Vùng 1 50kg',
          type: 'Giao ghép hàng',
          fee: '160.000đ'),
      OrderService(
          id: 4,
          name: 'NVX Hà Nội - Miền Bắc 1',
          type: 'Giao nguyên chuyến',
          fee: '230.000đ'),
    ];
    listService.first.isSelect = true;
    emit(state.copyWith(
        services: listService, serviceSelected: listService.first));
  }

  void updateStepOrder(StepOrderType stepOrderType) {
    emit(state.copyWith(stepOrderType: stepOrderType));
  }

  Future<void> selectService(OrderService service) async {
    emit(state.copyWith(isUpdate: true));
    final newList = state.services.map((e) {
      if (e.id == service.id) {
        service.isSelect = true;
        return service;
      } else {
        e.isSelect = false;
        return e;
      }
    }).toList();
    emit(state.copyWith(
        services: newList, isUpdate: false, serviceSelected: service));
  }

  void updateDeliveryPoint() {
    emit(state.copyWith(deliveryPoint: !state.deliveryPoint));
  }

  void updatePickupPoint() {
    emit(state.copyWith(pickupPoint: !state.pickupPoint));
  }

  void updateInsurance() {
    emit(state.copyWith(insurance: !state.insurance));
  }

  Future<void> getService(OrderRequest orderRequest) async {
    try {
      emit(state.copyWith(isLoading: true));
      await mainRepository.getOrderService(
          orderRequest.pickAddressId,
          orderRequest.toProvinceId,
          orderRequest.toDistrictId,
          orderRequest.parcelWeight,
          orderRequest.parcelQuantity,
          orderRequest.parcelLength,
          orderRequest.parcelWidth,
          orderRequest.parcelHeight,
          orderRequest.parcelValue,
          orderRequest.isInsured);
      emit(state.copyWith(isLoading: false));
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }
}
