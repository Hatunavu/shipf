// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(
      status: json['status'] as int,
      message: json['message'] as String,
      error: json['error'] as String?,
      data: (json['data'] as List<dynamic>)
          .map((e) => LocationData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'error': instance.error,
    };

LocationData _$LocationDataFromJson(Map<String, dynamic> json) => LocationData(
      code: json['code'] as String,
      name: json['name'] as String,
      unit: json['unit'] as String?,
      fullName: json['fullName'] as String?,
      provinceCode: json['provinceCode'] as String?,
      provinceName: json['provinceName'] as String?,
      districtCode: json['districtCode'] as String?,
      districtName: json['districtName'] as String?,
    );

Map<String, dynamic> _$LocationDataToJson(LocationData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'unit': instance.unit,
      'provinceCode': instance.provinceCode,
      'districtCode': instance.districtCode,
      'provinceName': instance.provinceName,
      'districtName': instance.districtName,
      'fullName': instance.fullName,
    };
