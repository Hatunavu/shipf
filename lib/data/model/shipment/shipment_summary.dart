import 'package:json_annotation/json_annotation.dart';
import 'package:shipf/enums/enum_shipment_status.dart';

part 'shipment_summary.g.dart';

@JsonSerializable()
class ShipmentSummaryResponse {
  final String message;
  final bool success;
  final int status;
  final List<ShipmentSummaryData> data;

  ShipmentSummaryResponse(
      {this.message = '',
      this.success = false,
      this.status = 0,
      this.data = const []});

  factory ShipmentSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$ShipmentSummaryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentSummaryResponseToJson(this);
}

@JsonSerializable()
class ShipmentSummaryData {
  @JsonKey(
      name: 'shipmentStatus',
      fromJson: stringToShipmentStatus,
      toJson: shipmentStatusToString)
  final ShipmentStatus shipmentStatus;
  final String shipmentStatusName;
  final int totalElements;

  ShipmentSummaryData(
      {this.shipmentStatus = ShipmentStatus.neww,
      this.shipmentStatusName = '',
      this.totalElements = 0});

  factory ShipmentSummaryData.fromJson(Map<String, dynamic> json) =>
      _$ShipmentSummaryDataFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentSummaryDataToJson(this);
}
