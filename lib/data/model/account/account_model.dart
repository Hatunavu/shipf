import 'package:json_annotation/json_annotation.dart';
import 'package:shipf/data/model/no_data/no_data_response.dart';
import 'package:shipf/enums/enum_zone_type.dart';

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
  final List<AccountZone> zones;
  AccountData(
      {this.id = 0,
      this.userConfigId = 0,
      this.roleId = 0,
      this.parentId = 0,
      this.code = '',
      this.name = '',
      this.phone = '',
      this.email = '',
      this.isActive = false,
      this.zones = const []});

  factory AccountData.fromJson(Map<String, dynamic> json) =>
      _$AccountDataFromJson(json);

  Map<String, dynamic> toJson() => _$AccountDataToJson(this);
}

@JsonSerializable()
class AccountZone {
  final int id;
  final int provinceId;
  final int? districtId;
  final int? wardId;
  final String fullAddress;
  final String code;
  @JsonKey(name: 'type', toJson: zoneTypeToString, fromJson: stringToZoneType)
  final ZoneType type;
  final bool isActive;
  AccountZone(
      {this.id = 0,
      this.provinceId = 0,
      this.districtId,
      this.wardId,
      this.fullAddress = '',
      this.code = '',
      this.type = ZoneType.pickupZone,
      this.isActive = true});

  factory AccountZone.fromJson(Map<String, dynamic> json) =>
      _$AccountZoneFromJson(json);

  Map<String, dynamic> toJson() => _$AccountZoneToJson(this);
}

@JsonSerializable()
class ZoneResponse {
  final String message;
  final List<AccountZone> data;
  final NoDataMetaData? metadata;
  final bool success;
  final int status;
  ZoneResponse(
      {this.message = '',
      this.data = const [],
      this.metadata,
      this.success = true,
      this.status = 0});

  factory ZoneResponse.fromJson(Map<String, dynamic> json) =>
      _$ZoneResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ZoneResponseToJson(this);
}

@JsonSerializable()
class AccountRequest {
  final String name;
  final String phone;
  final String? email;
  final String password;
  final List<String> zoneIds;

  AccountRequest(
      {this.name = '',
      this.phone = '',
      this.email,
      this.password = '',
      this.zoneIds = const []});

  factory AccountRequest.fromJson(Map<String, dynamic> json) =>
      _$AccountRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AccountRequestToJson(this);
}
