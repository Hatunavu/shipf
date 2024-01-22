// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipmentSummaryResponse _$ShipmentSummaryResponseFromJson(
        Map<String, dynamic> json) =>
    ShipmentSummaryResponse(
      message: json['message'] as String? ?? '',
      success: json['success'] as bool? ?? false,
      status: json['status'] as int? ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  ShipmentSummaryData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ShipmentSummaryResponseToJson(
        ShipmentSummaryResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

ShipmentSummaryData _$ShipmentSummaryDataFromJson(Map<String, dynamic> json) =>
    ShipmentSummaryData(
      shipmentStatus: json['shipmentStatus'] == null
          ? ShipmentStatus.neww
          : stringToShipmentStatus(json['shipmentStatus'] as String),
      totalElements: json['totalElements'] as int? ?? 0,
    );

Map<String, dynamic> _$ShipmentSummaryDataToJson(
        ShipmentSummaryData instance) =>
    <String, dynamic>{
      'shipmentStatus': shipmentStatusToString(instance.shipmentStatus),
      'totalElements': instance.totalElements,
    };
