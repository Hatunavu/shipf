// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderRequest _$OrderRequestFromJson(Map<String, dynamic> json) => OrderRequest(
      parcelWeight: json['parcel_weight'] as int,
      parcelWidth: json['parcel_width'] as int,
      parcelHeight: json['parcel_height'] as int,
      parcelLength: json['parcel_length'] as int,
      parcelQuantity: json['parcel_quantity'] as int,
      parcelValue: json['parcel_value'] as int,
      pickAddressId: json['pick_address_id'] as int,
      toProvinceId: json['to_province_id'] as int,
      toDistrictId: json['to_district_id'] as int,
      customerId: json['customer_id'] as int? ?? 0,
      isInsured: json['is_insured'] as bool? ?? false,
      loadingType: json['loading_type'] as String? ?? '',
    );

Map<String, dynamic> _$OrderRequestToJson(OrderRequest instance) =>
    <String, dynamic>{
      'parcel_weight': instance.parcelWeight,
      'parcel_width': instance.parcelWidth,
      'parcel_height': instance.parcelHeight,
      'parcel_length': instance.parcelLength,
      'parcel_quantity': instance.parcelQuantity,
      'parcel_value': instance.parcelValue,
      'pick_address_id': instance.pickAddressId,
      'to_province_id': instance.toProvinceId,
      'to_district_id': instance.toDistrictId,
      'customer_id': instance.customerId,
      'is_insured': instance.isInsured,
      'loading_type': instance.loadingType,
    };
