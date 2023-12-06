import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shipf/data/model/order/order_service.dart';
import 'package:shipf/enums/enum_step_order.dart';

part 'order_state.freezed.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState(
      {required bool isLoading,
      required bool isUpdate,
      String? error,
      required List<OrderService> services,
      OrderService? serviceSelected,
      required StepOrderType stepOrderType}) = _OrderState;

  factory OrderState.initial() => const OrderState(
      isLoading: false,
      error: "",
      stepOrderType: StepOrderType.address,
      services: [],
      isUpdate: false);
}
