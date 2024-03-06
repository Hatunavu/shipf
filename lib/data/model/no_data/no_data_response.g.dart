// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'no_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoDataResponse _$NoDataResponseFromJson(Map<String, dynamic> json) =>
    NoDataResponse(
      message: json['message'] as String? ?? '',
      success: json['success'] as bool? ?? false,
      status: json['status'] as int? ?? 0,
      metadata: json['metadata'] == null
          ? null
          : NoDataMetaData.fromJson(json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NoDataResponseToJson(NoDataResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'status': instance.status,
      'metadata': instance.metadata,
    };

NoDataMetaData _$NoDataMetaDataFromJson(Map<String, dynamic> json) =>
    NoDataMetaData(
      totalElements: json['totalElements'] as int? ?? 0,
      totalPages: json['totalPages'] as int? ?? 0,
      page: json['page'] as int? ?? 0,
      size: json['size'] as int? ?? 0,
    );

Map<String, dynamic> _$NoDataMetaDataToJson(NoDataMetaData instance) =>
    <String, dynamic>{
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
      'page': instance.page,
      'size': instance.size,
    };
