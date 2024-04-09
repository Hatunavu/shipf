// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostRequest _$PostRequestFromJson(Map<String, dynamic> json) => PostRequest(
      contactPhone: json['contactPhone'] as String? ?? '',
      content: json['content'] as String? ?? '',
      weight: json['weight'] as int? ?? 1,
      pickupProvinceIds: (json['pickupProvinceIds'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
      deliveryProvinceIds: (json['deliveryProvinceIds'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
      weightUnit: json['weightUnit'] == null
          ? WeightUnitType.ton
          : stringToWeightUnitType(json['weightUnit'] as String),
      tonnage: json['tonnage'] as String? ?? '',
      status: json['status'] == null
          ? PostStatusType.neww
          : stringToPostStatusType(json['status'] as String),
    );

Map<String, dynamic> _$PostRequestToJson(PostRequest instance) =>
    <String, dynamic>{
      'contactPhone': instance.contactPhone,
      'content': instance.content,
      'weight': instance.weight,
      'weightUnit': weightUnitTypeToString(instance.weightUnit),
      'pickupProvinceIds': instance.pickupProvinceIds,
      'deliveryProvinceIds': instance.deliveryProvinceIds,
      'tonnage': instance.tonnage,
      'status': postStatusTypeToString(instance.status),
    };

QuoteRequest _$QuoteRequestFromJson(Map<String, dynamic> json) => QuoteRequest(
      postId: json['postId'] as int? ?? 0,
      tonnageType: json['tonnage'] == null
          ? TonnageType.one
          : stringToTonnageType(json['tonnage'] as String),
      priceList: json['priceList'] as int? ?? 0,
      priceListUnit: json['priceListUnit'] as String? ?? 'VND',
      note: json['note'] as String? ?? '',
    );

Map<String, dynamic> _$QuoteRequestToJson(QuoteRequest instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'tonnage': tonnageTypeToString(instance.tonnageType),
      'priceList': instance.priceList,
      'priceListUnit': instance.priceListUnit,
      'note': instance.note,
    };
