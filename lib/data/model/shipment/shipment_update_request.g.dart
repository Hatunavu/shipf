// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipmentUpdateRequest _$ShipmentUpdateRequestFromJson(
        Map<String, dynamic> json) =>
    ShipmentUpdateRequest(
      shipmentId: json['shipmentId'] as int? ?? 0,
      shipmentStatusCode: json['shipmentStatusCode'] == null
          ? ShipmentUpdate.pickedUp
          : stringToShipmentUpdate(json['shipmentStatusCode'] as String),
    );

Map<String, dynamic> _$ShipmentUpdateRequestToJson(
        ShipmentUpdateRequest instance) =>
    <String, dynamic>{
      'shipmentId': instance.shipmentId,
      'shipmentStatusCode': shipmentUpdateToString(instance.shipmentStatusCode),
    };
