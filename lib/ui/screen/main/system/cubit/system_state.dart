import 'package:freezed_annotation/freezed_annotation.dart';

part 'system_state.freezed.dart';

@freezed
class SystemState with _$SystemState {
  const factory SystemState({
    required bool isLoading,
    String? error,
  }) = _SystemState;

  factory SystemState.initial() => const SystemState(
        isLoading: false,
        error: "",
      );
}
