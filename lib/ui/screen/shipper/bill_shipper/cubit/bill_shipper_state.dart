import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shipf/data/model/order/list_order.dart';

part 'bill_shipper_state.freezed.dart';

@freezed
class BillShipperState with _$BillShipperState {
  const factory BillShipperState(
      {required bool isLoading,
      String? error,
      required List<ListOrderData> listOrder}) = _BillShipperState;

  factory BillShipperState.initial() =>
      const BillShipperState(isLoading: false, error: "", listOrder: []);
}
