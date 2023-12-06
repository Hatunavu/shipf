import 'package:json_annotation/json_annotation.dart';

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
  final int statusCode;
  final String message;
  final String error;
  LoginResponse(
      {this.data,
      this.status = 0,
      this.success = false,
      this.statusCode = 0,
      this.message = '',
      this.error = ''});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class LoginData {
  @JsonKey(name: 'access_token')
  final String accessToken;

  LoginData({this.accessToken = ''});

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}

//register
@JsonSerializable()
class RegisterRequest {
  final String name;
  final String phone;
  final String password;

  RegisterRequest({this.name = '', this.phone = '', this.password = ''});

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}

@JsonSerializable()
class RegisterResponse {
  final bool success;
  final int status;
  final String message;
  // final RegisterData? data;

  RegisterResponse({this.success = false, this.message = '', this.status = 0});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}

@JsonSerializable()
class RegisterData {
  final String name;
  @JsonKey(name: 'role_id')
  final int roleId;
  final String phone;
  final String email;
  final String code;
  final int type;
  @JsonKey(name: 'assigned_carrier')
  final String assignedCarrier;
  @JsonKey(name: 'is_super')
  final bool isSuper;
  // @JsonKey(name: 'assigned_carrier_id')
  // final String assignedCarrierId;
  // @JsonKey(name: 'location_id')
  // final String locationId;
  // @JsonKey(name: 'avater_url')
  // final String avatarUrl;
  // @JsonKey(name: 'parent_id')
  // final String parentId;
  // @JsonKey(name: 'config_id')
  // final String configId;
  @JsonKey(name: 'is_active')
  final bool isActive;
  final int id;

  RegisterData(
      {this.roleId = 0,
      this.name = '',
      this.phone = '',
      this.email = '',
      this.code = '',
      this.type = 0,
      this.assignedCarrier = '',
      this.isSuper = false,
      this.isActive = false,
      this.id = 0});

  factory RegisterData.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterDataToJson(this);
}

//register business
@JsonSerializable()
class RegisterBusinessRequest {
  final String name;
  final String phone;
  final String password;
  final String email;

  RegisterBusinessRequest(
      {this.name = '', this.phone = '', this.password = '', this.email = ''});

  factory RegisterBusinessRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterBusinessRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterBusinessRequestToJson(this);
}

@JsonSerializable()
class RegisterBusinessResponse {
  final bool success;
  final int status;
  final String message;

  RegisterBusinessResponse(
      {this.success = false, this.message = '', this.status = 0});

  factory RegisterBusinessResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterBusinessResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterBusinessResponseToJson(this);
}
