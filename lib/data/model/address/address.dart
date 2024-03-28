import 'package:json_annotation/json_annotation.dart';
import 'package:shipf/enums/enum_loading_type.dart';

part 'address.g.dart';

@JsonSerializable()
class AddressModel {
  final List<AddressDataModel> data;
  final bool success;
  final int status;
  AddressModel({this.success = true, this.status = 0, this.data = const []});
  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}

@JsonSerializable()
class AddressDataModel {
  final int id;
  final String code;
  final String name;
  final String mapNames;
  final String shortName;
  final String zipcode;
  final int priority;
  final int provinceId;
  final int districtId;

  AddressDataModel(
      {this.id = 0,
      this.code = '',
      this.name = '',
      this.mapNames = '',
      this.shortName = '',
      this.zipcode = '',
      this.priority = 0,
      this.provinceId = 0,
      this.districtId = 0});
  factory AddressDataModel.fromJson(Map<String, dynamic> json) =>
      _$AddressDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressDataModelToJson(this);
}

@JsonSerializable()
class AddressSaved {
  final String message;
  final bool success;
  final int status;
  final List<AddressSavedData> data;
  AddressSaved(
      {this.success = true,
      this.status = 0,
      this.message = '',
      this.data = const []});
  factory AddressSaved.fromJson(Map<String, dynamic> json) =>
      _$AddressSavedFromJson(json);

  Map<String, dynamic> toJson() => _$AddressSavedToJson(this);
}

@JsonSerializable()
class AddressSavedData {
  final int id;
  final int customerId;
  final int provinceId;
  final int districtId;
  final int wardId;
  final String address;
  final String fullAddress;
  final String contactName;
  final String contactPhone;
  @JsonKey(
      name: 'type', toJson: loadingTypeToString, fromJson: stringToLoadingType)
  final LoadingType type;
  final bool isDefault;

  AddressSavedData({
    this.id = 0,
    this.customerId = 0,
    this.provinceId = 0,
    this.districtId = 0,
    this.wardId = 0,
    this.address = '',
    this.fullAddress = '',
    this.contactName = '',
    this.contactPhone = '',
    this.type = LoadingType.pickup,
    this.isDefault = false,
  });
  factory AddressSavedData.fromJson(Map<String, dynamic> json) =>
      _$AddressSavedDataFromJson(json);

  Map<String, dynamic> toJson() => _$AddressSavedDataToJson(this);
}
