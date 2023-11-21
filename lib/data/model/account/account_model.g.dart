// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      id: json['_id'] as String,
      profile: Profile.fromJson(json['profile'] as Map<String, dynamic>),
      phone: json['phone'] as String?,
      type: json['type'] as String?,
      password: json['password'] as String?,
      status: json['status'] as int? ?? 1,
      authentication: json['authentication'] == null
          ? null
          : AuthenticationModel.fromJson(
              json['authentication'] as Map<String, dynamic>),
      address: json['address'] as String?,
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      '_id': instance.id,
      'profile': instance.profile,
      'phone': instance.phone,
      'password': instance.password,
      'type': instance.type,
      'status': instance.status,
      'authentication': instance.authentication,
      'address': instance.address,
    };

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      fullName: json['fullName'] as String,
      avatar: json['avatar'] as String?,
      email: json['email'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'avatar': instance.avatar,
      'email': instance.email,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'gender': instance.gender,
    };

AuthenticationModel _$AuthenticationModelFromJson(Map<String, dynamic> json) =>
    AuthenticationModel(
      lock: json['lock'] as bool? ?? false,
      status: json['status'] as bool? ?? false,
      ip: json['ip'] as String?,
      recentSMSOTP: json['recentSMSOTP'] == null
          ? null
          : DateTime.parse(json['recentSMSOTP'] as String),
      isPhoneVerified: json['isPhoneVerified'] as bool? ?? false,
    );

Map<String, dynamic> _$AuthenticationModelToJson(
        AuthenticationModel instance) =>
    <String, dynamic>{
      'lock': instance.lock,
      'status': instance.status,
      'ip': instance.ip,
      'recentSMSOTP': instance.recentSMSOTP?.toIso8601String(),
      'isPhoneVerified': instance.isPhoneVerified,
    };
