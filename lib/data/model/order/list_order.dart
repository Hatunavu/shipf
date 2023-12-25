import 'package:json_annotation/json_annotation.dart';
import 'package:shipf/enums/enum_loading_type.dart';
import 'package:shipf/enums/enum_payment_type.dart';
import 'package:shipf/enums/enum_source_type.dart';

part 'list_order.g.dart';

@JsonSerializable()
class ListOrderResponse {
  final String message;
  final List<ListOrderData> data;
  final bool success;
  final int status;

  ListOrderResponse(
      {this.message = '',
      this.success = false,
      this.status = 0,
      this.data = const []});

  factory ListOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$ListOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListOrderResponseToJson(this);
}

@JsonSerializable()
class ListOrderData {
  final int id;
  final int pickupAddressId;
  final int deliveryAddressId;
  final int priceListId;
  final int customerId;
  final int carrierId;
  final int currentShipmentStatusTrackingId;
  final String code;
  final String name;
  final int quantity;
  final int length;
  final int width;
  final int height;
  final int netWeight;
  final double chargeableWeight;
  final String note;
  final bool isInsured;
  final String? loading;
  final int cod;
  final int declaredValue;
  final int freightCharge;
  final int insuranceCharge;
  final int returnCharge;
  final int loadingCharge;
  final int pickupCharge;
  final int deliveryCharge;
  final int surcharge;
  final int totalCharge;
  @JsonKey(
      name: 'source', toJson: sourceTypeToString, fromJson: stringToSourceType)
  final SourceType source;
  @JsonKey(
      name: 'paymentTerm',
      toJson: paymentTypeToString,
      fromJson: stringToPaymentType)
  final PaymentType paymentTerm;
  final ListOrderAddress? pickupAddress;
  final ListOrderAddress? deliveryAddress;

  ListOrderData(
      {this.id = 0,
      this.pickupAddressId = 0,
      this.deliveryAddressId = 0,
      this.priceListId = 0,
      this.customerId = 0,
      this.carrierId = 0,
      this.currentShipmentStatusTrackingId = 0,
      this.code = '',
      this.name = '',
      this.quantity = 0,
      this.length = 0,
      this.width = 0,
      this.height = 0,
      this.netWeight = 0,
      this.chargeableWeight = 0,
      this.note = '',
      this.isInsured = false,
      this.loading,
      this.cod = 0,
      this.declaredValue = 0,
      this.freightCharge = 0,
      this.insuranceCharge = 0,
      this.returnCharge = 0,
      this.loadingCharge = 0,
      this.pickupCharge = 0,
      this.deliveryCharge = 0,
      this.surcharge = 0,
      this.totalCharge = 0,
      this.source = SourceType.form,
      this.paymentTerm = PaymentType.freightPrepaid,
      this.pickupAddress,
      this.deliveryAddress});

  LoadingType? get loadingType {
    return loading != null ? stringToLoadingType(loading!) : null;
  }

  factory ListOrderData.fromJson(Map<String, dynamic> json) =>
      _$ListOrderDataFromJson(json);

  Map<String, dynamic> toJson() => _$ListOrderDataToJson(this);
}

@JsonSerializable()
class ListOrderAddress {
  final int id;
  final int customerId;
  final String name;
  final String phone;
  final bool isDefault;
  final int provinceId;
  final int districtId;
  final int wardId;
  final String address;
  final String fullAddress;

  ListOrderAddress({
    this.id = 0,
    this.customerId = 0,
    this.name = '',
    this.phone = '',
    this.isDefault = false,
    this.provinceId = 0,
    this.districtId = 0,
    this.wardId = 0,
    this.address = '',
    this.fullAddress = '',
  });

  factory ListOrderAddress.fromJson(Map<String, dynamic> json) =>
      _$ListOrderAddressFromJson(json);

  Map<String, dynamic> toJson() => _$ListOrderAddressToJson(this);
}
