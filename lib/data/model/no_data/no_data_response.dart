import 'package:json_annotation/json_annotation.dart';

part 'no_data_response.g.dart';

@JsonSerializable()
class NoDataResponse {
  final String message;
  final bool success;
  final int status;
  final NoDataMetaData? metadata;

  NoDataResponse(
      {this.message = '',
      this.success = false,
      this.status = 0,
      this.metadata});

  factory NoDataResponse.fromJson(Map<String, dynamic> json) =>
      _$NoDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NoDataResponseToJson(this);
}

@JsonSerializable()
class NoDataMetaData {
  final int totalElements;
  final int totalPages;
  final int page;
  final int size;

  NoDataMetaData(
      {this.totalElements = 0,
      this.totalPages = 0,
      this.page = 0,
      this.size = 0});

  factory NoDataMetaData.fromJson(Map<String, dynamic> json) =>
      _$NoDataMetaDataFromJson(json);

  Map<String, dynamic> toJson() => _$NoDataMetaDataToJson(this);
}
