import 'package:json_annotation/json_annotation.dart';
import 'package:shipf/enums/enum_role.dart';

part 'auth.g.dart';

//verify phone and otp
@JsonSerializable()
class VerifyRequest {
  final String phone;
  final String? otp;

  VerifyRequest({this.phone = '', this.otp});

  factory VerifyRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyRequestToJson(this);
}

@JsonSerializable()
class VerifyResponse {
  final String message;
  final bool success;
  final int status;

  VerifyResponse({this.message = '', this.status = 0, this.success = false});

  factory VerifyResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyResponseToJson(this);
}

//login
@JsonSerializable()
class LoginRequest {
  final String phone;
  final String password;

  LoginRequest({this.phone = '', this.password = ''});

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

@JsonSerializable()
class LoginResponse {
  final LoginData? data;
  final bool success;
  final int status;
  final String message;
  LoginResponse(
      {this.data, this.status = 0, this.success = false, this.message = ''});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class LoginData {
  @JsonKey(name: 'access_token')
  final String accessToken;
  final LoginDataUser? user;

  LoginData({this.accessToken = '', this.user});

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}

@JsonSerializable()
class LoginDataUser {
  final int id;
  final bool isActive;
  final String name;
  final String email;
  final String code;
  final String phone;
  final LoginDataUserRole? role;

  LoginDataUser(
      {this.id = 0,
      this.isActive = false,
      this.name = '',
      this.email = '',
      this.code = '',
      this.phone = '',
      this.role});

  factory LoginDataUser.fromJson(Map<String, dynamic> json) =>
      _$LoginDataUserFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataUserToJson(this);
}

@JsonSerializable()
class LoginDataUserRole {
  final int id;
  final String name;
  @JsonKey(
      name: 'code',
      fromJson: stringToRoleType,
      toJson: roleTypeToString,
      defaultValue: RoleType.customer)
  final RoleType roleType;

  LoginDataUserRole(
      {this.id = 0, this.name = '', this.roleType = RoleType.customer});

  factory LoginDataUserRole.fromJson(Map<String, dynamic> json) =>
      _$LoginDataUserRoleFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataUserRoleToJson(this);
}

//register
@JsonSerializable()
class RegisterRequest {
  final String name;
  final String phone;
  final String password;
  final bool isAcceptTermAndCondition;
  final String? email;

  RegisterRequest(
      {this.name = '',
      this.phone = '',
      this.password = '',
      this.email,
      this.isAcceptTermAndCondition = true});

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}

@JsonSerializable()
class RegisterResponse {
  final bool success;
  final int status;
  final String message;

  RegisterResponse({this.success = false, this.message = '', this.status = 0});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}
