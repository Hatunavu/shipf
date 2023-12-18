import 'package:json_annotation/json_annotation.dart';

part 'order_request.g.dart';

@JsonSerializable()
class OrderRequest {
  final int parcelWeight;
  final int parcelWidth;
  final int parcelHeight;
  final int parcelLength;
  final int parcelQuantity;
  final int parcelValue;
  final int pickAddressId;
  final int toProvinceId;
  final int toDistrictId;
  final int customerId;
  final bool isInsured;
  final String loadingType;

  OrderRequest(
      {required this.parcelWeight,
      required this.parcelWidth,
      required this.parcelHeight,
      required this.parcelLength,
      required this.parcelQuantity,
      required this.parcelValue,
      required this.pickAddressId,
      required this.toProvinceId,
      required this.toDistrictId,
      this.customerId = 0,
      this.isInsured = false,
      this.loadingType = ''});

  factory OrderRequest.fromJson(Map<String, dynamic> json) =>
      _$OrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OrderRequestToJson(this);
}
