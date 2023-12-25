// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListOrderResponse _$ListOrderResponseFromJson(Map<String, dynamic> json) =>
    ListOrderResponse(
      message: json['message'] as String? ?? '',
      success: json['success'] as bool? ?? false,
      status: json['status'] as int? ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => ListOrderData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ListOrderResponseToJson(ListOrderResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'success': instance.success,
      'status': instance.status,
    };

ListOrderData _$ListOrderDataFromJson(Map<String, dynamic> json) =>
    ListOrderData(
      id: json['id'] as int? ?? 0,
      pickupAddressId: json['pickupAddressId'] as int? ?? 0,
      deliveryAddressId: json['deliveryAddressId'] as int? ?? 0,
      priceListId: json['priceListId'] as int? ?? 0,
      customerId: json['customerId'] as int? ?? 0,
      carrierId: json['carrierId'] as int? ?? 0,
      currentShipmentStatusTrackingId:
          json['currentShipmentStatusTrackingId'] as int? ?? 0,
      code: json['code'] as String? ?? '',
      name: json['name'] as String? ?? '',
      quantity: json['quantity'] as int? ?? 0,
      length: json['length'] as int? ?? 0,
      width: json['width'] as int? ?? 0,
      height: json['height'] as int? ?? 0,
      netWeight: json['netWeight'] as int? ?? 0,
      chargeableWeight: (json['chargeableWeight'] as num?)?.toDouble() ?? 0,
      note: json['note'] as String? ?? '',
      isInsured: json['isInsured'] as bool? ?? false,
      loading: json['loading'] as String?,
      cod: json['cod'] as int? ?? 0,
      declaredValue: json['declaredValue'] as int? ?? 0,
      freightCharge: json['freightCharge'] as int? ?? 0,
      insuranceCharge: json['insuranceCharge'] as int? ?? 0,
      returnCharge: json['returnCharge'] as int? ?? 0,
      loadingCharge: json['loadingCharge'] as int? ?? 0,
      pickupCharge: json['pickupCharge'] as int? ?? 0,
      deliveryCharge: json['deliveryCharge'] as int? ?? 0,
      surcharge: json['surcharge'] as int? ?? 0,
      totalCharge: json['totalCharge'] as int? ?? 0,
      source: json['source'] == null
          ? SourceType.form
          : stringToSourceType(json['source'] as String),
      paymentTerm: json['paymentTerm'] == null
          ? PaymentType.freightPrepaid
          : stringToPaymentType(json['paymentTerm'] as String),
      pickupAddress: json['pickupAddress'] == null
          ? null
          : ListOrderAddress.fromJson(
              json['pickupAddress'] as Map<String, dynamic>),
      deliveryAddress: json['deliveryAddress'] == null
          ? null
          : ListOrderAddress.fromJson(
              json['deliveryAddress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ListOrderDataToJson(ListOrderData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pickupAddressId': instance.pickupAddressId,
      'deliveryAddressId': instance.deliveryAddressId,
      'priceListId': instance.priceListId,
      'customerId': instance.customerId,
      'carrierId': instance.carrierId,
      'currentShipmentStatusTrackingId':
          instance.currentShipmentStatusTrackingId,
      'code': instance.code,
      'name': instance.name,
      'quantity': instance.quantity,
      'length': instance.length,
      'width': instance.width,
      'height': instance.height,
      'netWeight': instance.netWeight,
      'chargeableWeight': instance.chargeableWeight,
      'note': instance.note,
      'isInsured': instance.isInsured,
      'loading': instance.loading,
      'cod': instance.cod,
      'declaredValue': instance.declaredValue,
      'freightCharge': instance.freightCharge,
      'insuranceCharge': instance.insuranceCharge,
      'returnCharge': instance.returnCharge,
      'loadingCharge': instance.loadingCharge,
      'pickupCharge': instance.pickupCharge,
      'deliveryCharge': instance.deliveryCharge,
      'surcharge': instance.surcharge,
      'totalCharge': instance.totalCharge,
      'source': sourceTypeToString(instance.source),
      'paymentTerm': paymentTypeToString(instance.paymentTerm),
      'pickupAddress': instance.pickupAddress,
      'deliveryAddress': instance.deliveryAddress,
    };

ListOrderAddress _$ListOrderAddressFromJson(Map<String, dynamic> json) =>
    ListOrderAddress(
      id: json['id'] as int? ?? 0,
      customerId: json['customerId'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      isDefault: json['isDefault'] as bool? ?? false,
      provinceId: json['provinceId'] as int? ?? 0,
      districtId: json['districtId'] as int? ?? 0,
      wardId: json['wardId'] as int? ?? 0,
      address: json['address'] as String? ?? '',
      fullAddress: json['fullAddress'] as String? ?? '',
    );

Map<String, dynamic> _$ListOrderAddressToJson(ListOrderAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'name': instance.name,
      'phone': instance.phone,
      'isDefault': instance.isDefault,
      'provinceId': instance.provinceId,
      'districtId': instance.districtId,
      'wardId': instance.wardId,
      'address': instance.address,
      'fullAddress': instance.fullAddress,
    };
