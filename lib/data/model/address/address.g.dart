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
      provinceId: json['provinceId'] as int? ?? 0,
      districtId: json['districtId'] as int? ?? 0,
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
      'provinceId': instance.provinceId,
      'districtId': instance.districtId,
    };

AddressSaved _$AddressSavedFromJson(Map<String, dynamic> json) => AddressSaved(
      success: json['success'] as bool? ?? true,
      status: json['status'] as int? ?? 0,
      message: json['message'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => AddressSavedData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AddressSavedToJson(AddressSaved instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

AddressSavedData _$AddressSavedDataFromJson(Map<String, dynamic> json) =>
    AddressSavedData(
      id: json['id'] as int? ?? 0,
      customerId: json['customerId'] as int? ?? 0,
      provinceId: json['provinceId'] as int? ?? 0,
      districtId: json['districtId'] as int? ?? 0,
      wardId: json['wardId'] as int? ?? 0,
      address: json['address'] as String? ?? '',
      fullAddress: json['fullAddress'] as String? ?? '',
      contactName: json['contactName'] as String? ?? '',
      contactPhone: json['contactPhone'] as String? ?? '',
      type: json['type'] == null
          ? LoadingType.pickup
          : stringToLoadingType(json['type'] as String),
      isDefault: json['isDefault'] as bool? ?? false,
    );

Map<String, dynamic> _$AddressSavedDataToJson(AddressSavedData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'provinceId': instance.provinceId,
      'districtId': instance.districtId,
      'wardId': instance.wardId,
      'address': instance.address,
      'fullAddress': instance.fullAddress,
      'contactName': instance.contactName,
      'contactPhone': instance.contactPhone,
      'type': loadingTypeToString(instance.type),
      'isDefault': instance.isDefault,
    };
