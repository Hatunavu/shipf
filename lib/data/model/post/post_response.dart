import 'package:json_annotation/json_annotation.dart';
import 'package:shipf/data/model/no_data/no_data_response.dart';
import 'package:shipf/enums/enum_post_status.dart';
import 'package:shipf/enums/enum_weight_unit.dart';

part 'post_response.g.dart';

@JsonSerializable()
class PostResponse extends NoDataResponse {
  final List<PostData> data;

  PostResponse({this.data = const []});

  factory PostResponse.fromJson(Map<String, dynamic> json) =>
      _$PostResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostResponseToJson(this);
}

@JsonSerializable()
class PostData {
  final int id;
  final String contactPhone;
  final String content;
  final int weight;
  @JsonKey(
      name: 'weightUnit',
      toJson: weightUnitTypeToString,
      fromJson: stringToWeightUnitType)
  final WeightUnitType weightUnit;
  final String tonnage;
  final int ownerId;
  @JsonKey(
      name: 'status',
      toJson: postStatusTypeToString,
      fromJson: stringToPostStatusType)
  final PostStatusType status;
  final DateTime? approvedAt;
  final DateTime? rejectedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  PostData(
      {this.id = 0,
      this.contactPhone = '',
      this.content = '',
      this.weight = 0,
      this.weightUnit = WeightUnitType.kg,
      this.tonnage = '',
      this.ownerId = 0,
      this.status = PostStatusType.neww,
      this.approvedAt,
      this.rejectedAt,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  factory PostData.fromJson(Map<String, dynamic> json) =>
      _$PostDataFromJson(json);

  Map<String, dynamic> toJson() => _$PostDataToJson(this);
}
