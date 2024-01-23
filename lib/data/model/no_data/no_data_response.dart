import 'package:json_annotation/json_annotation.dart';

part 'no_data_response.g.dart';

@JsonSerializable()
class NoDataResponse {
  final String message;
  final bool success;
  final int status;

  NoDataResponse({this.message = '', this.success = false, this.status = 0});

  factory NoDataResponse.fromJson(Map<String, dynamic> json) =>
      _$NoDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NoDataResponseToJson(this);
}
