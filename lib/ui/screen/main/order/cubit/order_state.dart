import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shipf/enums/enum_step_order.dart';

part 'order_state.freezed.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState(
      {required bool isLoading,
      String? error,
      required StepOrderType stepOrderType}) = _OrderState;

  factory OrderState.initial() => const OrderState(
      isLoading: false, error: "", stepOrderType: StepOrderType.address);
}
