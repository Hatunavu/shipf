// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      success: json['success'] as bool? ?? true,
      status: json['status'] as int? ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => AddressDataModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
      'status': instance.status,
    };

AddressDataModel _$AddressDataModelFromJson(Map<String, dynamic> json) =>
    AddressDataModel(
      id: json['id'] as int? ?? 0,
      code: json['code'] as String? ?? '',
      name: json['name'] as String? ?? '',
      mapNames: json['mapNames'] as String? ?? '',
      shortName: json['shortName'] as String? ?? '',
      zipcode: json['zipcode'] as String? ?? '',
      priority: json['priority'] as int? ?? 0,
      provinceId: json['province_id'] as int? ?? 0,
      districtId: json['district_id'] as int? ?? 0,
    );

Map<String, dynamic> _$AddressDataModelToJson(AddressDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'mapNames': instance.mapNames,
      'shortName': instance.shortName,
      'zipcode': instance.zipcode,
      'priority': instance.priority,
      'province_id': instance.provinceId,
      'district_id': instance.districtId,
    };
