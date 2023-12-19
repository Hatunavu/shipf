// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderRequest _$OrderRequestFromJson(Map<String, dynamic> json) => OrderRequest(
      pickupAddressId: json['pickupAddressId'] as int? ?? 0,
      pickupProvinceId: json['pickupProvinceId'] as int? ?? 0,
      pickupDistrictId: json['pickupDistrictId'] as int? ?? 0,
      pickupWardId: json['pickupWardId'] as int? ?? 0,
      pickupAddress: json['pickupAddress'] as String? ?? '',
      pickupName: json['pickupName'] as String? ?? '',
      pickupPhone: json['pickupPhone'] as String? ?? '',
      deliveryAddressId: json['deliveryAddressId'] as int? ?? 0,
      deliveryProvinceId: json['deliveryProvinceId'] as int? ?? 0,
      deliveryDistrictId: json['deliveryDistrictId'] as int? ?? 0,
      deliveryWardId: json['deliveryWardId'] as int? ?? 0,
      deliveryAddress: json['deliveryAddress'] as String? ?? '',
      deliveryName: json['deliveryName'] as String? ?? '',
      deliveryPhone: json['deliveryPhone'] as String? ?? '',
      priceListId: json['priceListId'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      netWeight: json['netWeight'] as int? ?? 0,
      quantity: json['quantity'] as int? ?? 0,
      length: json['length'] as int? ?? 0,
      width: json['width'] as int? ?? 0,
      height: json['height'] as int? ?? 0,
      declaredValue: json['declaredValue'] as int? ?? 0,
      source: json['source'] as String? ?? '',
      paymentTerm: json['paymentTerm'] as String? ?? '',
      isInsured: json['isInsured'] as bool? ?? false,
      loading: json['loading'] as String? ?? '',
      cod: json['cod'] as int? ?? 0,
      note: json['note'] as String? ?? '',
    );

Map<String, dynamic> _$OrderRequestToJson(OrderRequest instance) =>
    <String, dynamic>{
      'pickupAddressId': instance.pickupAddressId,
      'pickupProvinceId': instance.pickupProvinceId,
      'pickupDistrictId': instance.pickupDistrictId,
      'pickupWardId': instance.pickupWardId,
      'pickupAddress': instance.pickupAddress,
      'pickupName': instance.pickupName,
      'pickupPhone': instance.pickupPhone,
      'deliveryAddressId': instance.deliveryAddressId,
      'deliveryProvinceId': instance.deliveryProvinceId,
      'deliveryDistrictId': instance.deliveryDistrictId,
      'deliveryWardId': instance.deliveryWardId,
      'deliveryAddress': instance.deliveryAddress,
      'deliveryName': instance.deliveryName,
      'deliveryPhone': instance.deliveryPhone,
      'priceListId': instance.priceListId,
      'name': instance.name,
      'netWeight': instance.netWeight,
      'quantity': instance.quantity,
      'length': instance.length,
      'width': instance.width,
      'height': instance.height,
      'declaredValue': instance.declaredValue,
      'source': instance.source,
      'paymentTerm': instance.paymentTerm,
      'isInsured': instance.isInsured,
      'loading': instance.loading,
      'cod': instance.cod,
      'note': instance.note,
    };
