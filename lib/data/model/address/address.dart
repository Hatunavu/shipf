import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class AddressModel {
  final List<AddressDataModel> data;
  final bool success;
  final MetaData? metadata;
  AddressModel({this.success = true, this.metadata, this.data = const []});
  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}

@JsonSerializable()
class AddressDataModel {
  final int id;
  @JsonKey(name: 'is_active')
  final bool isAvtive;
  final String code;
  final String name;
  @JsonKey(name: 'map_names')
  final String mapNames;
  @JsonKey(name: 'short_name')
  final String shortName;
  final String zipcode;
  final int priority;
  @JsonKey(name: 'province_id')
  final int provinceId;
  @JsonKey(name: 'district_id')
  final int districtId;

  AddressDataModel(
      {this.id = 0,
      this.isAvtive = false,
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
class MetaData {
  final int totalRecord;
  MetaData({this.totalRecord = 0});
  factory MetaData.fromJson(Map<String, dynamic> json) =>
      _$MetaDataFromJson(json);

  Map<String, dynamic> toJson() => _$MetaDataToJson(this);
}
