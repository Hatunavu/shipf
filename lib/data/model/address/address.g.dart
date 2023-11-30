// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      success: json['success'] as bool? ?? true,
      metadata: json['metadata'] == null
          ? null
          : MetaData.fromJson(json['metadata'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => AddressDataModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
      'metadata': instance.metadata,
    };

AddressDataModel _$AddressDataModelFromJson(Map<String, dynamic> json) =>
    AddressDataModel(
      id: json['id'] as int? ?? 0,
      isAvtive: json['is_active'] as bool? ?? false,
      code: json['code'] as String? ?? '',
      name: json['name'] as String? ?? '',
      mapNames: json['map_names'] as String? ?? '',
      shortName: json['short_name'] as String? ?? '',
      zipcode: json['zipcode'] as String? ?? '',
      priority: json['priority'] as int? ?? 0,
      provinceId: json['province_id'] as int? ?? 0,
      districtId: json['district_id'] as int? ?? 0,
    );

Map<String, dynamic> _$AddressDataModelToJson(AddressDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_active': instance.isAvtive,
      'code': instance.code,
      'name': instance.name,
      'map_names': instance.mapNames,
      'short_name': instance.shortName,
      'zipcode': instance.zipcode,
      'priority': instance.priority,
      'province_id': instance.provinceId,
      'district_id': instance.districtId,
    };

MetaData _$MetaDataFromJson(Map<String, dynamic> json) => MetaData(
      totalRecord: json['totalRecord'] as int? ?? 0,
    );

Map<String, dynamic> _$MetaDataToJson(MetaData instance) => <String, dynamic>{
      'totalRecord': instance.totalRecord,
    };
