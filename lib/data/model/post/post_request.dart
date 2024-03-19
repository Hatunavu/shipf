import 'package:json_annotation/json_annotation.dart';
import 'package:shipf/enums/enum_post_status.dart';
import 'package:shipf/enums/enum_weight_unit.dart';

part 'post_request.g.dart';

@JsonSerializable()
class PostRequest {
  final String contactPhone;
  final String content;
  final int weight;
  @JsonKey(
      name: 'weightUnit',
      fromJson: stringToWeightUnitType,
      toJson: weightUnitTypeToString)
  final WeightUnitType weightUnit;
  final List<int> pickupProvinceIds;
  final List<int> deliveryProvinceIds;
  final String tonnage;
  @JsonKey(
      name: 'status',
      fromJson: stringToPostStatusType,
      toJson: postStatusTypeToString)
  final PostStatusType status;

  PostRequest(
      {this.contactPhone = '',
      this.content = '',
      this.weight = 1,
      this.pickupProvinceIds = const [],
      this.deliveryProvinceIds = const [],
      this.weightUnit = WeightUnitType.ton,
      this.tonnage = '',
      this.status = PostStatusType.neww});

  factory PostRequest.fromJson(Map<String, dynamic> json) =>
      _$PostRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PostRequestToJson(this);
}
