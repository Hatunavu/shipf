// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderRequest _$OrderRequestFromJson(Map<String, dynamic> json) => OrderRequest(
      parcelWeight: json['parcelWeight'] as int,
      parcelWidth: json['parcelWidth'] as int,
      parcelHeight: json['parcelHeight'] as int,
      parcelLength: json['parcelLength'] as int,
      parcelQuantity: json['parcelQuantity'] as int,
      parcelValue: json['parcelValue'] as int,
      pickAddressId: json['pickAddressId'] as int,
      toProvinceId: json['toProvinceId'] as int,
      toDistrictId: json['toDistrictId'] as int,
      customerId: json['customerId'] as int? ?? 0,
      isInsured: json['isInsured'] as bool? ?? false,
      loadingType: json['loadingType'] as String? ?? '',
    );

Map<String, dynamic> _$OrderRequestToJson(OrderRequest instance) =>
    <String, dynamic>{
      'parcelWeight': instance.parcelWeight,
      'parcelWidth': instance.parcelWidth,
      'parcelHeight': instance.parcelHeight,
      'parcelLength': instance.parcelLength,
      'parcelQuantity': instance.parcelQuantity,
      'parcelValue': instance.parcelValue,
      'pickAddressId': instance.pickAddressId,
      'toProvinceId': instance.toProvinceId,
      'toDistrictId': instance.toDistrictId,
      'customerId': instance.customerId,
      'isInsured': instance.isInsured,
      'loadingType': instance.loadingType,
    };
