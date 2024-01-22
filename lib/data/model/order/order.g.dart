// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderRequest _$OrderRequestFromJson(Map<String, dynamic> json) => OrderRequest(
      pickupProvinceId: json['pickupProvinceId'] as int?,
      pickupDistrictId: json['pickupDistrictId'] as int?,
      pickupWardId: json['pickupWardId'] as int?,
      pickupAddress: json['pickupAddress'] as String? ?? '',
      pickupName: json['pickupName'] as String? ?? '',
      pickupPhone: json['pickupPhone'] as String? ?? '',
      deliveryProvinceId: json['deliveryProvinceId'] as int?,
      deliveryDistrictId: json['deliveryDistrictId'] as int?,
      deliveryWardId: json['deliveryWardId'] as int?,
      deliveryAddress: json['deliveryAddress'] as String? ?? '',
      deliveryName: json['deliveryName'] as String? ?? '',
      deliveryPhone: json['deliveryPhone'] as String? ?? '',
      priceListId: json['priceListId'] as int? ?? 0,
      goodsName: json['goodsName'] as String? ?? '',
      netWeight: json['netWeight'] as int? ?? 0,
      quantity: json['quantity'] as int? ?? 0,
      length: json['length'] as int? ?? 0,
      width: json['width'] as int? ?? 0,
      height: json['height'] as int? ?? 0,
      declaredValue: json['declaredValue'] as int? ?? 0,
      source: json['source'] == null
          ? SourceType.form
          : stringToSourceType(json['source'] as String),
      paymentTerm: json['paymentTerm'] == null
          ? PaymentType.freightPrepaid
          : stringToPaymentType(json['paymentTerm'] as String),
      isInsured: json['isInsured'] as bool? ?? false,
      loading: json['loading'] as String?,
      cod: json['cod'] as int? ?? 0,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$OrderRequestToJson(OrderRequest instance) =>
    <String, dynamic>{
      'pickupProvinceId': instance.pickupProvinceId,
      'pickupDistrictId': instance.pickupDistrictId,
      'pickupWardId': instance.pickupWardId,
      'pickupAddress': instance.pickupAddress,
      'pickupName': instance.pickupName,
      'pickupPhone': instance.pickupPhone,
      'deliveryProvinceId': instance.deliveryProvinceId,
      'deliveryDistrictId': instance.deliveryDistrictId,
      'deliveryWardId': instance.deliveryWardId,
      'deliveryAddress': instance.deliveryAddress,
      'deliveryName': instance.deliveryName,
      'deliveryPhone': instance.deliveryPhone,
      'priceListId': instance.priceListId,
      'goodsName': instance.goodsName,
      'netWeight': instance.netWeight,
      'quantity': instance.quantity,
      'length': instance.length,
      'width': instance.width,
      'height': instance.height,
      'declaredValue': instance.declaredValue,
      'source': sourceTypeToString(instance.source),
      'paymentTerm': paymentTypeToString(instance.paymentTerm),
      'isInsured': instance.isInsured,
      'loading': instance.loading,
      'cod': instance.cod,
      'note': instance.note,
    };

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) =>
    OrderResponse(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      status: json['status'] as int? ?? 0,
    );

Map<String, dynamic> _$OrderResponseToJson(OrderResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'message': instance.message,
    };

UpdateOrderStatusRequest _$UpdateOrderStatusRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateOrderStatusRequest(
      shipmentStatusCode: json['shipmentStatusCode'] == null
          ? ShipmentStatus.neww
          : stringToShipmentStatus(json['shipmentStatusCode'] as String),
      note: json['note'] as String? ?? '',
    );

Map<String, dynamic> _$UpdateOrderStatusRequestToJson(
        UpdateOrderStatusRequest instance) =>
    <String, dynamic>{
      'shipmentStatusCode': shipmentStatusToString(instance.shipmentStatusCode),
      'note': instance.note,
    };
