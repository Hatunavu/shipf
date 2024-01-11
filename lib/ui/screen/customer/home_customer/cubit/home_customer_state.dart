import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_customer_state.freezed.dart';

@freezed
class HomeCustomerState with _$HomeCustomerState {
  const factory HomeCustomerState({
    required bool isLoading,
    String? error,
  }) = _HomeCustomerState;

  factory HomeCustomerState.initial() => const HomeCustomerState(
        isLoading: false,
        error: "",
      );
}
