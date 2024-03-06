// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyRequest _$VerifyRequestFromJson(Map<String, dynamic> json) =>
    VerifyRequest(
      phone: json['phone'] as String? ?? '',
      otp: json['otp'] as String?,
    );

Map<String, dynamic> _$VerifyRequestToJson(VerifyRequest instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'otp': instance.otp,
    };

VerifyResponse _$VerifyResponseFromJson(Map<String, dynamic> json) =>
    VerifyResponse(
      message: json['message'] as String? ?? '',
      status: json['status'] as int? ?? 0,
      success: json['success'] as bool? ?? false,
    );

Map<String, dynamic> _$VerifyResponseToJson(VerifyResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'status': instance.status,
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
      data: json['data'] == null
          ? null
          : LoginData.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as int? ?? 0,
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
      'status': instance.status,
      'message': instance.message,
    };

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
      accessToken: json['accessToken'] as String? ?? '',
      user: json['user'] == null
          ? null
          : LoginDataUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'user': instance.user,
    };

LoginDataUser _$LoginDataUserFromJson(Map<String, dynamic> json) =>
    LoginDataUser(
      id: json['id'] as int? ?? 0,
      isActive: json['isActive'] as bool? ?? false,
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      code: json['code'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      roles: (json['roles'] as List<dynamic>?)
              ?.map(
                  (e) => LoginDataUserRole.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$LoginDataUserToJson(LoginDataUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isActive': instance.isActive,
      'name': instance.name,
      'email': instance.email,
      'code': instance.code,
      'phone': instance.phone,
      'roles': instance.roles,
    };

LoginDataUserRole _$LoginDataUserRoleFromJson(Map<String, dynamic> json) =>
    LoginDataUserRole(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      roleType: json['code'] == null
          ? RoleType.customer
          : stringToRoleType(json['code'] as String),
    );

Map<String, dynamic> _$LoginDataUserRoleToJson(LoginDataUserRole instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': roleTypeToString(instance.roleType),
    };

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      name: json['name'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      password: json['password'] as String? ?? '',
      email: json['email'] as String?,
      isAcceptTermAndCondition:
          json['isAcceptTermAndCondition'] as bool? ?? true,
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'password': instance.password,
      'isAcceptTermAndCondition': instance.isAcceptTermAndCondition,
      'email': instance.email,
    };

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      status: json['status'] as int? ?? 0,
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'message': instance.message,
    };
