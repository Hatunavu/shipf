import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {
  final List<LocationData> data;
  final int status;
  final String message;
  final String? error;
  LocationModel(
      {required this.status,
      required this.message,
      this.error,
      required this.data});
  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}

@JsonSerializable()
class LocationData {
  final String code;
  final String name;
  final String? unit;
  final String? provinceCode;
  final String? districtCode;
  final String? provinceName;
  final String? districtName;
  final String? fullName;
  LocationData(
      {required this.code,
      required this.name,
      this.unit,
      this.fullName,
      this.provinceCode,
      this.provinceName,
      this.districtCode,
      this.districtName});
  factory LocationData.fromJson(Map<String, dynamic> json) =>
      _$LocationDataFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDataToJson(this);
}
