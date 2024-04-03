// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      id: json['_id'] as String,
      phone: json['phone'] as String?,
      type: json['type'] as String?,
      password: json['password'] as String?,
      status: json['status'] as int? ?? 1,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      '_id': instance.id,
      'phone': instance.phone,
      'password': instance.password,
      'type': instance.type,
      'status': instance.status,
      'address': instance.address,
    };

AccountResponse _$AccountResponseFromJson(Map<String, dynamic> json) =>
    AccountResponse(
      message: json['message'] as String? ?? '',
      status: json['status'] as int? ?? 0,
      success: json['success'] as bool? ?? false,
      data: json['data'] == null
          ? null
          : AccountData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccountResponseToJson(AccountResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

AccountData _$AccountDataFromJson(Map<String, dynamic> json) => AccountData(
      id: json['id'] as int? ?? 0,
      userConfigId: json['userConfigId'] as int? ?? 0,
      roleId: json['roleId'] as int? ?? 0,
      parentId: json['parentId'] as int? ?? 0,
      code: json['code'] as String? ?? '',
      name: json['name'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      email: json['email'] as String? ?? '',
      isActive: json['isActive'] as bool? ?? false,
      zones: (json['zones'] as List<dynamic>?)
              ?.map((e) => AccountZone.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AccountDataToJson(AccountData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userConfigId': instance.userConfigId,
      'roleId': instance.roleId,
      'parentId': instance.parentId,
      'code': instance.code,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'isActive': instance.isActive,
      'zones': instance.zones,
    };

AccountZone _$AccountZoneFromJson(Map<String, dynamic> json) => AccountZone(
      id: json['id'] as int? ?? 0,
      provinceId: json['provinceId'] as int? ?? 0,
      districtId: json['districtId'] as int?,
      wardId: json['wardId'] as int?,
      fullAddress: json['fullAddress'] as String? ?? '',
      code: json['code'] as String? ?? '',
      type: json['type'] == null
          ? ZoneType.pickupZone
          : stringToZoneType(json['type'] as String),
      isActive: json['isActive'] as bool? ?? true,
    );

Map<String, dynamic> _$AccountZoneToJson(AccountZone instance) =>
    <String, dynamic>{
      'id': instance.id,
      'provinceId': instance.provinceId,
      'districtId': instance.districtId,
      'wardId': instance.wardId,
      'fullAddress': instance.fullAddress,
      'code': instance.code,
      'type': zoneTypeToString(instance.type),
      'isActive': instance.isActive,
    };

ZoneResponse _$ZoneResponseFromJson(Map<String, dynamic> json) => ZoneResponse(
      message: json['message'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => AccountZone.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      metadata: json['metadata'] == null
          ? null
          : NoDataMetaData.fromJson(json['metadata'] as Map<String, dynamic>),
      success: json['success'] as bool? ?? true,
      status: json['status'] as int? ?? 0,
    );

Map<String, dynamic> _$ZoneResponseToJson(ZoneResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'metadata': instance.metadata,
      'success': instance.success,
      'status': instance.status,
    };

AccountRequest _$AccountRequestFromJson(Map<String, dynamic> json) =>
    AccountRequest(
      name: json['name'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      email: json['email'] as String?,
      password: json['password'] as String? ?? '',
      zoneIds: (json['zoneIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AccountRequestToJson(AccountRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'password': instance.password,
      'zoneIds': instance.zoneIds,
    };
