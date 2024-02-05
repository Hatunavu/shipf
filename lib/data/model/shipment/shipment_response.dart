import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shipf/enums/enum_loading_type.dart';
import 'package:shipf/enums/enum_payment_type.dart';
import 'package:shipf/enums/enum_shipment_status.dart';
import 'package:shipf/enums/enum_source_type.dart';
import 'package:shipf/foundation/extension/date_formatting.dart';

part 'shipment_response.g.dart';

@JsonSerializable()
class ShipmentResponse {
  final String message;
  final List<ShipmentData> data;
  final bool success;
  final int status;

  ShipmentResponse(
      {this.message = '',
      this.success = false,
      this.status = 0,
      this.data = const []});

  factory ShipmentResponse.fromJson(Map<String, dynamic> json) =>
      _$ShipmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentResponseToJson(this);
}

@JsonSerializable()
class ShipmentDetail {
  final String message;
  final ShipmentData? data;
  final bool success;
  final int status;

  ShipmentDetail(
      {this.message = '', this.success = false, this.status = 0, this.data});

  factory ShipmentDetail.fromJson(Map<String, dynamic> json) =>
      _$ShipmentDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentDetailToJson(this);
}

@JsonSerializable()
class ShipmentData {
  final int id;
  final int pickupAddressId;
  final int deliveryAddressId;
  final int priceListId;
  final int customerId;
  final int carrierId;
  final int shipperId;
  final int currentShipmentStatusTrackingId;
  final String code;
  final String goodsName;
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
  final int totalShipperCharge;
  final int pickupLeadTime;
  final int deliveryLeadTime;
  @JsonKey(
      name: 'source', toJson: sourceTypeToString, fromJson: stringToSourceType)
  final SourceType source;
  @JsonKey(
      name: 'paymentTerm',
      toJson: paymentTypeToString,
      fromJson: stringToPaymentType)
  final PaymentType paymentTerm;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  final ShipmentAddress? pickupAddress;
  final ShipmentAddress? deliveryAddress;
  final ShipmentStatusTracking? currentShipmentStatusTracking;

  ShipmentData(
      {this.id = 0,
      this.pickupAddressId = 0,
      this.deliveryAddressId = 0,
      this.priceListId = 0,
      this.customerId = 0,
      this.carrierId = 0,
      this.shipperId = 0,
      this.currentShipmentStatusTrackingId = 0,
      this.code = '',
      this.goodsName = '',
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
      this.totalShipperCharge = 0,
      this.pickupLeadTime = 0,
      this.deliveryLeadTime = 0,
      this.source = SourceType.form,
      this.paymentTerm = PaymentType.freightPrepaid,
      this.createdAt,
      this.updatedAt,
      this.pickupAddress,
      this.deliveryAddress,
      this.currentShipmentStatusTracking});

  LoadingType? get loadingType {
    return loading != null ? stringToLoadingType(loading!) : null;
  }

  String get totalFee {
    return NumberFormat.decimalPattern().format(totalCharge).toString();
  }

  String get updatedTime {
    if (updatedAt == null) return '';
    return DateFormatting(updatedAt!).tohhmmddMMyyyy();
  }

  factory ShipmentData.fromJson(Map<String, dynamic> json) =>
      _$ShipmentDataFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentDataToJson(this);
}

@JsonSerializable()
class ShipmentAddress {
  final int id;
  final int customerId;
  final String contactName;
  final String contactPhone;
  final bool isDefault;
  final int provinceId;
  final int districtId;
  final int wardId;
  final String address;
  final String fullAddress;

  ShipmentAddress({
    this.id = 0,
    this.customerId = 0,
    this.contactName = '',
    this.contactPhone = '',
    this.isDefault = false,
    this.provinceId = 0,
    this.districtId = 0,
    this.wardId = 0,
    this.address = '',
    this.fullAddress = '',
  });

  factory ShipmentAddress.fromJson(Map<String, dynamic> json) =>
      _$ShipmentAddressFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentAddressToJson(this);
}

@JsonSerializable()
class ShipmentStatusTracking {
  final int id;
  final int shipmentId;
  final int updatedById;
  final int shipmentStatusId;
  final String note;
  final DateTime? createdAt;
  final ShipmentShipmentStatus? shipmentStatus;

  ShipmentStatusTracking(
      {this.id = 0,
      this.shipmentId = 0,
      this.updatedById = 0,
      this.shipmentStatusId = 0,
      this.note = '',
      this.createdAt,
      this.shipmentStatus});

  factory ShipmentStatusTracking.fromJson(Map<String, dynamic> json) =>
      _$ShipmentStatusTrackingFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentStatusTrackingToJson(this);
}

@JsonSerializable()
class ShipmentShipmentStatus {
  final int id;

  @JsonKey(
      name: 'code',
      fromJson: stringToShipmentStatus,
      toJson: shipmentStatusToString)
  final ShipmentStatus code;
  final String name;
  final String message;
  final String color;

  ShipmentShipmentStatus(
      {this.id = 0,
      this.code = ShipmentStatus.neww,
      this.name = '',
      this.message = '',
      this.color = ''});

  factory ShipmentShipmentStatus.fromJson(Map<String, dynamic> json) =>
      _$ShipmentShipmentStatusFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentShipmentStatusToJson(this);
}
