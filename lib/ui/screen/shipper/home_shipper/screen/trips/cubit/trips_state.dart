import 'package:freezed_annotation/freezed_annotation.dart';

part 'trips_state.freezed.dart';

@freezed
class TripsState with _$TripsState {
  const factory TripsState({
    required bool isLoading,
    String? error,
  }) = _TripsState;

  factory TripsState.initial() => const TripsState(isLoading: false, error: "");
}
