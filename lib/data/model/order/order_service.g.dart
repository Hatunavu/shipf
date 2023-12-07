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
    );

Map<String, dynamic> _$OrderServiceResponseToJson(
        OrderServiceResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
    };

OrderServiceData _$OrderServiceDataFromJson(Map<String, dynamic> json) =>
    OrderServiceData(
      priceList: json['priceList'] == null
          ? null
          : PriceList.fromJson(json['priceList'] as Map<String, dynamic>),
      fee: json['fee'] == null
          ? null
          : Fee.fromJson(json['fee'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderServiceDataToJson(OrderServiceData instance) =>
    <String, dynamic>{
      'priceList': instance.priceList,
      'fee': instance.fee,
    };

PriceList _$PriceListFromJson(Map<String, dynamic> json) => PriceList(
      id: json['id'] as int? ?? 0,
      isActive: json['isActive'] as bool? ?? false,
      createdAt: json['createdAt'] as String? ?? '',
      name: json['name'] as String? ?? '',
      type: json['type'] as String? ?? '',
      suburbanPickFee: json['suburbanPickFee'] as int? ?? 0,
      countryPickFee: json['countryPickFee'] as int? ?? 0,
      suburbanDelFee: json['suburbanDelFee'] as int? ?? 0,
      countryDelFee: json['countryDelFee'] as int? ?? 0,
      loadFee: json['loadFee'] as int? ?? 0,
      returnFeeUnit: json['returnFeeUnit'] as String? ?? '',
      returnFeeValue: json['returnFeeValue'] as int? ?? 0,
      insuranceFee: (json['insuranceFee'] as num?)?.toDouble() ?? 0,
      insuranceValue: json['insuranceValue'] as int? ?? 0,
      minValue: json['minValue'] as int? ?? 0,
      leadTime: json['leadTime'] as int? ?? 0,
      ownerId: json['ownerId'] as int? ?? 0,
      fromRegionId: json['fromRegionId'] as int? ?? 0,
      toRegionId: json['toRegionId'] as int? ?? 0,
    );

Map<String, dynamic> _$PriceListToJson(PriceList instance) => <String, dynamic>{
      'id': instance.id,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt,
      'name': instance.name,
      'type': instance.type,
      'suburbanPickFee': instance.suburbanPickFee,
      'countryPickFee': instance.countryPickFee,
      'suburbanDelFee': instance.suburbanDelFee,
      'countryDelFee': instance.countryDelFee,
      'loadFee': instance.loadFee,
      'returnFeeUnit': instance.returnFeeUnit,
      'returnFeeValue': instance.returnFeeValue,
      'insuranceFee': instance.insuranceFee,
      'insuranceValue': instance.insuranceValue,
      'minValue': instance.minValue,
      'leadTime': instance.leadTime,
      'ownerId': instance.ownerId,
      'fromRegionId': instance.fromRegionId,
      'toRegionId': instance.toRegionId,
    };

Fee _$FeeFromJson(Map<String, dynamic> json) => Fee(
      serviceFee: json['serviceFee'] as int? ?? 0,
      insuranceFee: json['insuranceFee'] as int? ?? 0,
      returnFee: json['returnFee'] as int? ?? 0,
      regionPickFee: json['regionPickFee'] as int? ?? 0,
      regionDeliverFee: json['regionDeliverFee'] as int? ?? 0,
      codFee: json['codFee'] as int? ?? 0,
      loadFee: json['loadFee'] as int? ?? 0,
      totalFee: json['totalFee'] as int? ?? 0,
    );

Map<String, dynamic> _$FeeToJson(Fee instance) => <String, dynamic>{
      'serviceFee': instance.serviceFee,
      'insuranceFee': instance.insuranceFee,
      'returnFee': instance.returnFee,
      'regionPickFee': instance.regionPickFee,
      'regionDeliverFee': instance.regionDeliverFee,
      'codFee': instance.codFee,
      'loadFee': instance.loadFee,
      'totalFee': instance.totalFee,
    };
