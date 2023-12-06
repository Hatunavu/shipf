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
