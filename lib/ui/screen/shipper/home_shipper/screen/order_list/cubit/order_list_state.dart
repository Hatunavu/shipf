import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shipf/data/model/shipment/shipment_response.dart';

part 'order_list_state.freezed.dart';

@freezed
class OrderListState with _$OrderListState {
  const factory OrderListState(
      {required bool isLoading,
      String? error,
      required List<ShipmentData> listOrder}) = _OrderListState;

  factory OrderListState.initial() =>
      const OrderListState(isLoading: false, error: "", listOrder: []);
}
