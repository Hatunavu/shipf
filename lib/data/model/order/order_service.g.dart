// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderService _$OrderServiceFromJson(Map<String, dynamic> json) => OrderService(
      name: json['name'] as String? ?? '',
      fee: json['fee'] as String? ?? '',
      type: json['type'] as String? ?? '',
      isSelect: json['isSelect'] as bool? ?? false,
      id: json['id'] as int? ?? 0,
    );

Map<String, dynamic> _$OrderServiceToJson(OrderService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'fee': instance.fee,
      'isSelect': instance.isSelect,
    };

OrderServiceResponse _$OrderServiceResponseFromJson(
        Map<String, dynamic> json) =>
    OrderServiceResponse(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => OrderServiceData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      status: json['status'] as int? ?? 0,
    );

Map<String, dynamic> _$OrderServiceResponseToJson(
        OrderServiceResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
      'status': instance.status,
      'message': instance.message,
    };

OrderServiceData _$OrderServiceDataFromJson(Map<String, dynamic> json) =>
    OrderServiceData(
      id: json['id'] as int? ?? 0,
      code: json['code'] as String? ?? '',
      name: json['name'] as String? ?? '',
      type: json['type'] == null
          ? OrderType.express
          : stringToOrderType(json['type'] as String),
      urbanPickupCharge: json['urbanPickupCharge'] as int? ?? 0,
      urbanDeliveryCharge: json['urbanDeliveryCharge'] as int? ?? 0,
      townPickupCharge: json['townPickupCharge'] as int? ?? 0,
      townDeliveryCharge: json['townDeliveryCharge'] as int? ?? 0,
      loadingCharge: json['loadingCharge'] as int? ?? 0,
      returnChargeUnit: json['returnChargeUnit'] as String? ?? '',
      returnCharge: json['returnCharge'] as int? ?? 0,
      insuranceCharge: (json['insuranceCharge'] as num?)?.toDouble() ?? 0,
      insuranceValue: json['insuranceValue'] as int? ?? 0,
      minFreightCharge: json['minFreightCharge'] as int? ?? 0,
      leadTime: json['leadTime'] as int? ?? 0,
      isActive: json['isActive'] as bool? ?? false,
      charges: json['charges'] == null
          ? null
          : Charges.fromJson(json['charges'] as Map<String, dynamic>),
      isSelect: json['isSelect'] as bool? ?? false,
    );

Map<String, dynamic> _$OrderServiceDataToJson(OrderServiceData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'type': orderTypeToString(instance.type),
      'urbanPickupCharge': instance.urbanPickupCharge,
      'urbanDeliveryCharge': instance.urbanDeliveryCharge,
      'townPickupCharge': instance.townPickupCharge,
      'townDeliveryCharge': instance.townDeliveryCharge,
      'loadingCharge': instance.loadingCharge,
      'returnChargeUnit': instance.returnChargeUnit,
      'returnCharge': instance.returnCharge,
      'insuranceCharge': instance.insuranceCharge,
      'insuranceValue': instance.insuranceValue,
      'minFreightCharge': instance.minFreightCharge,
      'leadTime': instance.leadTime,
      'isActive': instance.isActive,
      'charges': instance.charges,
      'isSelect': instance.isSelect,
    };

Charges _$ChargesFromJson(Map<String, dynamic> json) => Charges(
      freightCharge: json['freightCharge'] as int? ?? 0,
      loadingCharge: json['loadingCharge'] as int? ?? 0,
      insuranceCharge: json['insuranceCharge'] as int? ?? 0,
      returnCharge: json['returnCharge'] as int? ?? 0,
      pickupCharge: json['pickupCharge'] as int? ?? 0,
      deliveryCharge: json['deliveryCharge'] as int? ?? 0,
    );

Map<String, dynamic> _$ChargesToJson(Charges instance) => <String, dynamic>{
      'freightCharge': instance.freightCharge,
      'loadingCharge': instance.loadingCharge,
      'insuranceCharge': instance.insuranceCharge,
      'returnCharge': instance.returnCharge,
      'pickupCharge': instance.pickupCharge,
      'deliveryCharge': instance.deliveryCharge,
    };
