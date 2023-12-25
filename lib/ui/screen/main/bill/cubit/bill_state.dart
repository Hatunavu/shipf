import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shipf/data/model/order/list_order.dart';

part 'bill_state.freezed.dart';

@freezed
class BillState with _$BillState {
  const factory BillState(
      {required bool isLoading,
      String? error,
      required List<ListOrderData> listOrder}) = _BillState;

  factory BillState.initial() =>
      const BillState(isLoading: false, error: "", listOrder: []);
}
