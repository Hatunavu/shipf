import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shipf/data/model/shipment/shipment_response.dart';

part 'shipments_state.freezed.dart';

@freezed
class ShipmentsState with _$ShipmentsState {
  const factory ShipmentsState(
      {required bool isLoading,
      String? error,
      required List<ShipmentData> shipments}) = _ShipmentsState;

  factory ShipmentsState.initial() =>
      const ShipmentsState(isLoading: false, error: "", shipments: []);
}
