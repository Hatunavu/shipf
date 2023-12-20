import 'package:json_annotation/json_annotation.dart';
import 'package:shipf/enums/enum_payment_type.dart';
import 'package:shipf/enums/enum_source_type.dart';

part 'order.g.dart';

@JsonSerializable()
class OrderRequest {
  // final int pickupAddressId;
  final int? pickupProvinceId;
  final int? pickupDistrictId;
  final int? pickupWardId;
  final String pickupAddress;
  final String pickupName;
  final String pickupPhone;
  // final int deliveryAddressId;
  final int? deliveryProvinceId;
  final int? deliveryDistrictId;
  final int? deliveryWardId;
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
  @JsonKey(
    name: 'source',
    toJson: sourceTypeToString,
    fromJson: stringToSourceType,
  )
  final SourceType source;
  @JsonKey(
      name: 'paymentTerm',
      toJson: paymentTypeToString,
      fromJson: stringToPaymentType)
  final PaymentType paymentTerm;
  final bool isInsured;
  final String? loading;
  final int cod;
  final String? note;

  OrderRequest(
      {
      // this.pickupAddressId = 0,
      this.pickupProvinceId,
      this.pickupDistrictId,
      this.pickupWardId,
      this.pickupAddress = '',
      this.pickupName = '',
      this.pickupPhone = '',
      // this.deliveryAddressId = 0,
      this.deliveryProvinceId,
      this.deliveryDistrictId,
      this.deliveryWardId,
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
      this.source = SourceType.form,
      this.paymentTerm = PaymentType.freightPrepaid,
      this.isInsured = false,
      this.loading,
      this.cod = 0,
      this.note});

  factory OrderRequest.fromJson(Map<String, dynamic> json) =>
      _$OrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OrderRequestToJson(this);
}

@JsonSerializable()
class OrderResponse {
  final bool success;
  final int status;
  final String message;

  OrderResponse({this.success = false, this.message = '', this.status = 0});

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);
}
