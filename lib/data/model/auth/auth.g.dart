// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyRequest _$VerifyRequestFromJson(Map<String, dynamic> json) =>
    VerifyRequest(
      phoneNumber: json['phone_number'] as String? ?? '',
      otp: json['otp'] as String?,
    );

Map<String, dynamic> _$VerifyRequestToJson(VerifyRequest instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
      'otp': instance.otp,
    };

VerifyResponse _$VerifyResponseFromJson(Map<String, dynamic> json) =>
    VerifyResponse(
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$VerifyResponseToJson(VerifyResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
      phone: json['phone'] as String? ?? '',
      password: json['password'] as String? ?? '',
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'password': instance.password,
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      data: json['data'] as String? ?? '',
      success: json['success'] as bool? ?? false,
      statusCode: json['statusCode'] as int? ?? 0,
      message: json['message'] as String? ?? '',
      error: json['error'] as String? ?? '',
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'error': instance.error,
    };

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      name: json['name'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
      password: json['password'] as String? ?? '',
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'password': instance.password,
    };

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      success: json['success'] as bool? ?? false,
      data: json['data'] == null
          ? null
          : RegisterData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

RegisterData _$RegisterDataFromJson(Map<String, dynamic> json) => RegisterData(
      roleId: json['role_id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      email: json['email'] as String? ?? '',
      code: json['code'] as String? ?? '',
      type: json['type'] as int? ?? 0,
      assignedCarrier: json['assigned_carrier'] as String? ?? '',
      isSuper: json['is_super'] as bool? ?? false,
      isActive: json['is_active'] as bool? ?? false,
      id: json['id'] as int? ?? 0,
    );

Map<String, dynamic> _$RegisterDataToJson(RegisterData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'role_id': instance.roleId,
      'phone': instance.phone,
      'email': instance.email,
      'code': instance.code,
      'type': instance.type,
      'assigned_carrier': instance.assignedCarrier,
      'is_super': instance.isSuper,
      'is_active': instance.isActive,
      'id': instance.id,
    };
