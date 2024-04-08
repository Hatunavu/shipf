import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_shipper_state.freezed.dart';

@freezed
class HomeShipperState with _$HomeShipperState {
  const factory HomeShipperState(
      {required bool isLoading,
      String? error,
      required List<int> analysis,
      required List<int> newElements}) = _HomeShipperState;

  factory HomeShipperState.initial() => const HomeShipperState(
      isLoading: false, error: "", analysis: [], newElements: []);
}
