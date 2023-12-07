import 'package:json_annotation/json_annotation.dart';

part 'order_request.g.dart';

@JsonSerializable()
class OrderRequest {
  @JsonKey(name: 'parcel_weight')
  final int parcelWeight;
  @JsonKey(name: 'parcel_width')
  final int parcelWidth;
  @JsonKey(name: 'parcel_height')
  final int parcelHeight;
  @JsonKey(name: 'parcel_length')
  final int parcelLength;
  @JsonKey(name: 'parcel_quantity')
  final int parcelQuantity;
  @JsonKey(name: 'parcel_value')
  final int parcelValue;
  @JsonKey(name: 'pick_address_id')
  final int pickAddressId;
  @JsonKey(name: 'to_province_id')
  final int toProvinceId;
  @JsonKey(name: 'to_district_id')
  final int toDistrictId;
  @JsonKey(name: 'customer_id')
  final int customerId;
  @JsonKey(name: 'is_insured')
  final bool isInsured;
  @JsonKey(name: 'loading_type')
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
