// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transit_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransitSummaryResponse _$TransitSummaryResponseFromJson(
        Map<String, dynamic> json) =>
    TransitSummaryResponse(
      message: json['message'] as String? ?? '',
      success: json['success'] as bool? ?? false,
      status: json['status'] as int? ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map(
                  (e) => TransitSummaryData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TransitSummaryResponseToJson(
        TransitSummaryResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

TransitSummaryData _$TransitSummaryDataFromJson(Map<String, dynamic> json) =>
    TransitSummaryData(
      type: json['type'] == null
          ? LoadingType.pickup
          : stringToLoadingType(json['type'] as String),
      totalElements: json['totalElements'] as int? ?? 0,
    );

Map<String, dynamic> _$TransitSummaryDataToJson(TransitSummaryData instance) =>
    <String, dynamic>{
      'type': loadingTypeToString(instance.type),
      'totalElements': instance.totalElements,
    };
