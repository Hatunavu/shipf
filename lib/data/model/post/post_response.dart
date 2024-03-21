import 'package:json_annotation/json_annotation.dart';
import 'package:shipf/data/model/address/address.dart';
import 'package:shipf/enums/enum_post_status.dart';
import 'package:shipf/enums/enum_weight_unit.dart';
import 'package:shipf/foundation/extension/date_formatting.dart';

part 'post_response.g.dart';

@JsonSerializable()
class PostResponse {
  final String message;
  final bool success;
  final int status;
  final List<PostData> data;
  final PostMetaData? metadata;

  PostResponse(
      {this.data = const [],
      this.message = '',
      this.success = false,
      this.status = 0,
      this.metadata});

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
  final List<AddressDataModel> pickupProvinces;
  final List<AddressDataModel> deliveryProvinces;

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
      this.deletedAt,
      this.pickupProvinces = const [],
      this.deliveryProvinces = const []});

  String get createdTime {
    if (createdAt == null) return '';
    return DateFormatting(createdAt!).tohhmmddMMyyyy();
  }

  factory PostData.fromJson(Map<String, dynamic> json) =>
      _$PostDataFromJson(json);

  Map<String, dynamic> toJson() => _$PostDataToJson(this);
}

@JsonSerializable()
class PostMetaData {
  final int totalElements;
  final int totalPages;
  final int page;
  final int size;

  PostMetaData(
      {this.totalElements = 0,
      this.totalPages = 0,
      this.page = 0,
      this.size = 0});

  factory PostMetaData.fromJson(Map<String, dynamic> json) =>
      _$PostMetaDataFromJson(json);

  Map<String, dynamic> toJson() => _$PostMetaDataToJson(this);
}
