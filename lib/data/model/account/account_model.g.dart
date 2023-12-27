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
    };
