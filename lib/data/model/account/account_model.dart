import 'package:json_annotation/json_annotation.dart';

part 'account_model.g.dart';

@JsonSerializable()
class Account {
  @JsonKey(name: '_id')
  final String id;
  final String? phone;
  final String? password;
  final String? type;
  final int? status;
  final String? address;
  Account(
      {required this.id,
      this.phone,
      this.type,
      this.password,
      this.status = 1,
      this.address});

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}

@JsonSerializable()
class AccountResponse {
  final String message;
  final bool success;
  final int status;
  final AccountData? data;
  AccountResponse(
      {this.message = '', this.status = 0, this.success = false, this.data});

  factory AccountResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AccountResponseToJson(this);
}

@JsonSerializable()
class AccountData {
  final int id;
  final int userConfigId;
  final int roleId;
  final int parentId;
  final String code;
  final String name;
  final String phone;
  final String email;
  final bool isActive;
  AccountData(
      {this.id = 0,
      this.userConfigId = 0,
      this.roleId = 0,
      this.parentId = 0,
      this.code = '',
      this.name = '',
      this.phone = '',
      this.email = '',
      this.isActive = false});

  factory AccountData.fromJson(Map<String, dynamic> json) =>
      _$AccountDataFromJson(json);

  Map<String, dynamic> toJson() => _$AccountDataToJson(this);
}
