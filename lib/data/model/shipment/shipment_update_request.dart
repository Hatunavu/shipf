import 'package:json_annotation/json_annotation.dart';
import 'package:shipf/enums/enum_shipment_update.dart';

part 'shipment_update_request.g.dart';

@JsonSerializable()
class ShipmentUpdateRequest {
  final int shipmentId;
  @JsonKey(
      name: 'shipmentStatusCode',
      fromJson: stringToShipmentUpdate,
      toJson: shipmentUpdateToString)
  final ShipmentUpdate shipmentStatusCode;

  ShipmentUpdateRequest(
      {this.shipmentId = 0, this.shipmentStatusCode = ShipmentUpdate.pickedUp});

  factory ShipmentUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$ShipmentUpdateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentUpdateRequestToJson(this);
}
