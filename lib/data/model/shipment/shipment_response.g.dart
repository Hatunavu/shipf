// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipmentResponse _$ShipmentResponseFromJson(Map<String, dynamic> json) =>
    ShipmentResponse(
      message: json['message'] as String? ?? '',
      success: json['success'] as bool? ?? false,
      status: json['status'] as int? ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => ShipmentData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ShipmentResponseToJson(ShipmentResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'success': instance.success,
      'status': instance.status,
    };

ShipmentDetail _$ShipmentDetailFromJson(Map<String, dynamic> json) =>
    ShipmentDetail(
      message: json['message'] as String? ?? '',
      success: json['success'] as bool? ?? false,
      status: json['status'] as int? ?? 0,
      data: json['data'] == null
          ? null
          : ShipmentData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShipmentDetailToJson(ShipmentDetail instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'success': instance.success,
      'status': instance.status,
    };

ShipmentData _$ShipmentDataFromJson(Map<String, dynamic> json) => ShipmentData(
      id: json['id'] as int? ?? 0,
      pickupAddressId: json['pickupAddressId'] as int? ?? 0,
      deliveryAddressId: json['deliveryAddressId'] as int? ?? 0,
      priceListId: json['priceListId'] as int? ?? 0,
      customerId: json['customerId'] as int? ?? 0,
      carrierId: json['carrierId'] as int? ?? 0,
      shipperId: json['shipperId'] as int? ?? 0,
      currentShipmentStatusTrackingId:
          json['currentShipmentStatusTrackingId'] as int? ?? 0,
      code: json['code'] as String? ?? '',
      goodsName: json['goodsName'] as String? ?? '',
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
      totalShipperCharge: json['totalShipperCharge'] as int? ?? 0,
      pickupLeadTime: json['pickupLeadTime'] as int? ?? 0,
      deliveryLeadTime: json['deliveryLeadTime'] as int? ?? 0,
      source: json['source'] == null
          ? SourceType.form
          : stringToSourceType(json['source'] as String),
      paymentTerm: json['paymentTerm'] == null
          ? PaymentType.freightPrepaid
          : stringToPaymentType(json['paymentTerm'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      pickupAddress: json['pickupAddress'] == null
          ? null
          : ShipmentAddress.fromJson(
              json['pickupAddress'] as Map<String, dynamic>),
      deliveryAddress: json['deliveryAddress'] == null
          ? null
          : ShipmentAddress.fromJson(
              json['deliveryAddress'] as Map<String, dynamic>),
      currentShipmentStatusTracking: json['currentShipmentStatusTracking'] ==
              null
          ? null
          : ShipmentStatusTracking.fromJson(
              json['currentShipmentStatusTracking'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShipmentDataToJson(ShipmentData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pickupAddressId': instance.pickupAddressId,
      'deliveryAddressId': instance.deliveryAddressId,
      'priceListId': instance.priceListId,
      'customerId': instance.customerId,
      'carrierId': instance.carrierId,
      'shipperId': instance.shipperId,
      'currentShipmentStatusTrackingId':
          instance.currentShipmentStatusTrackingId,
      'code': instance.code,
      'goodsName': instance.goodsName,
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
      'totalShipperCharge': instance.totalShipperCharge,
      'pickupLeadTime': instance.pickupLeadTime,
      'deliveryLeadTime': instance.deliveryLeadTime,
      'source': sourceTypeToString(instance.source),
      'paymentTerm': paymentTypeToString(instance.paymentTerm),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'pickupAddress': instance.pickupAddress,
      'deliveryAddress': instance.deliveryAddress,
      'currentShipmentStatusTracking': instance.currentShipmentStatusTracking,
    };

ShipmentAddress _$ShipmentAddressFromJson(Map<String, dynamic> json) =>
    ShipmentAddress(
      id: json['id'] as int? ?? 0,
      customerId: json['customerId'] as int? ?? 0,
      contactName: json['contactName'] as String? ?? '',
      contactPhone: json['contactPhone'] as String? ?? '',
      isDefault: json['isDefault'] as bool? ?? false,
      provinceId: json['provinceId'] as int? ?? 0,
      districtId: json['districtId'] as int? ?? 0,
      wardId: json['wardId'] as int? ?? 0,
      address: json['address'] as String? ?? '',
      fullAddress: json['fullAddress'] as String? ?? '',
    );

Map<String, dynamic> _$ShipmentAddressToJson(ShipmentAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'contactName': instance.contactName,
      'contactPhone': instance.contactPhone,
      'isDefault': instance.isDefault,
      'provinceId': instance.provinceId,
      'districtId': instance.districtId,
      'wardId': instance.wardId,
      'address': instance.address,
      'fullAddress': instance.fullAddress,
    };

ShipmentStatusTracking _$ShipmentStatusTrackingFromJson(
        Map<String, dynamic> json) =>
    ShipmentStatusTracking(
      id: json['id'] as int? ?? 0,
      shipmentId: json['shipmentId'] as int? ?? 0,
      updatedById: json['updatedById'] as int? ?? 0,
      shipmentStatusId: json['shipmentStatusId'] as int? ?? 0,
      note: json['note'] as String? ?? '',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      shipmentStatus: json['shipmentStatus'] == null
          ? null
          : ShipmentShipmentStatus.fromJson(
              json['shipmentStatus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShipmentStatusTrackingToJson(
        ShipmentStatusTracking instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shipmentId': instance.shipmentId,
      'updatedById': instance.updatedById,
      'shipmentStatusId': instance.shipmentStatusId,
      'note': instance.note,
      'createdAt': instance.createdAt?.toIso8601String(),
      'shipmentStatus': instance.shipmentStatus,
    };

ShipmentShipmentStatus _$ShipmentShipmentStatusFromJson(
        Map<String, dynamic> json) =>
    ShipmentShipmentStatus(
      id: json['id'] as int? ?? 0,
      code: json['code'] == null
          ? ShipmentStatus.neww
          : stringToShipmentStatus(json['code'] as String),
      name: json['name'] as String? ?? '',
      message: json['message'] as String? ?? '',
      color: json['color'] as String? ?? '',
    );

Map<String, dynamic> _$ShipmentShipmentStatusToJson(
        ShipmentShipmentStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': shipmentStatusToString(instance.code),
      'name': instance.name,
      'message': instance.message,
      'color': instance.color,
    };
