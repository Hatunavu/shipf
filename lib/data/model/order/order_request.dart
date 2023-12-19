import 'package:json_annotation/json_annotation.dart';

part 'order_request.g.dart';

@JsonSerializable()
class OrderRequest {
  final int pickupAddressId;
  final int pickupProvinceId;
  final int pickupDistrictId;
  final int pickupWardId;
  final String pickupAddress;
  final String pickupName;
  final String pickupPhone;
  final int deliveryAddressId;
  final int deliveryProvinceId;
  final int deliveryDistrictId;
  final int deliveryWardId;
  final String deliveryAddress;
  final String deliveryName;
  final String deliveryPhone;
  final int priceListId;
  final String name;
  final int netWeight;
  final int quantity;
  final int length;
  final int width;
  final int height;
  final int declaredValue;
  final String source;
  final String paymentTerm;
  final bool isInsured;
  final String loading;
  final int cod;
  final String note;

  OrderRequest(
      {this.pickupAddressId = 0,
      this.pickupProvinceId = 0,
      this.pickupDistrictId = 0,
      this.pickupWardId = 0,
      this.pickupAddress = '',
      this.pickupName = '',
      this.pickupPhone = '',
      this.deliveryAddressId = 0,
      this.deliveryProvinceId = 0,
      this.deliveryDistrictId = 0,
      this.deliveryWardId = 0,
      this.deliveryAddress = '',
      this.deliveryName = '',
      this.deliveryPhone = '',
      this.priceListId = 0,
      this.name = '',
      this.netWeight = 0,
      this.quantity = 0,
      this.length = 0,
      this.width = 0,
      this.height = 0,
      this.declaredValue = 0,
      this.source = '',
      this.paymentTerm = '',
      this.isInsured = false,
      this.loading = '',
      this.cod = 0,
      this.note = ''});

  factory OrderRequest.fromJson(Map<String, dynamic> json) =>
      _$OrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OrderRequestToJson(this);
}
