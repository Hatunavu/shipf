import 'package:json_annotation/json_annotation.dart';
import 'package:shipf/enums/enum_loading_type.dart';

part 'transit_summary.g.dart';

@JsonSerializable()
class TransitSummaryResponse {
  final String message;
  final bool success;
  final int status;
  final List<TransitSummaryData> data;

  TransitSummaryResponse(
      {this.message = '',
      this.success = false,
      this.status = 0,
      this.data = const []});

  factory TransitSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$TransitSummaryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TransitSummaryResponseToJson(this);
}

@JsonSerializable()
class TransitSummaryData {
  @JsonKey(
      name: 'type', fromJson: stringToLoadingType, toJson: loadingTypeToString)
  final LoadingType type;
  final int totalElements;

  TransitSummaryData({this.type = LoadingType.pickup, this.totalElements = 0});

  factory TransitSummaryData.fromJson(Map<String, dynamic> json) =>
      _$TransitSummaryDataFromJson(json);

  Map<String, dynamic> toJson() => _$TransitSummaryDataToJson(this);
}
