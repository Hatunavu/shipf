import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_state.freezed.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState({
    required bool isLoading,
    String? error,
  }) = _OrderState;

  factory OrderState.initial() => const OrderState(isLoading: false, error: "");
}
