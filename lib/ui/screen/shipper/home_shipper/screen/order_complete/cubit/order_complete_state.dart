import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_complete_state.freezed.dart';

@freezed
class OrderCompleteState with _$OrderCompleteState {
  const factory OrderCompleteState({
    required bool isLoading,
    String? error,
  }) = _OrderCompleteState;

  factory OrderCompleteState.initial() =>
      const OrderCompleteState(isLoading: false, error: "");
}
