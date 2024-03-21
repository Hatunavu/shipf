// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostResponse _$PostResponseFromJson(Map<String, dynamic> json) => PostResponse(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => PostData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      message: json['message'] as String? ?? '',
      success: json['success'] as bool? ?? false,
      status: json['status'] as int? ?? 0,
      metadata: json['metadata'] == null
          ? null
          : PostMetaData.fromJson(json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostResponseToJson(PostResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
      'metadata': instance.metadata,
    };

PostData _$PostDataFromJson(Map<String, dynamic> json) => PostData(
      id: json['id'] as int? ?? 0,
      contactPhone: json['contactPhone'] as String? ?? '',
      content: json['content'] as String? ?? '',
      weight: json['weight'] as int? ?? 0,
      weightUnit: json['weightUnit'] == null
          ? WeightUnitType.kg
          : stringToWeightUnitType(json['weightUnit'] as String),
      tonnage: json['tonnage'] as String? ?? '',
      ownerId: json['ownerId'] as int? ?? 0,
      status: json['status'] == null
          ? PostStatusType.neww
          : stringToPostStatusType(json['status'] as String),
      approvedAt: json['approvedAt'] == null
          ? null
          : DateTime.parse(json['approvedAt'] as String),
      rejectedAt: json['rejectedAt'] == null
          ? null
          : DateTime.parse(json['rejectedAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      pickupProvinces: (json['pickupProvinces'] as List<dynamic>?)
              ?.map((e) => AddressDataModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      deliveryProvinces: (json['deliveryProvinces'] as List<dynamic>?)
              ?.map((e) => AddressDataModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PostDataToJson(PostData instance) => <String, dynamic>{
      'id': instance.id,
      'contactPhone': instance.contactPhone,
      'content': instance.content,
      'weight': instance.weight,
      'weightUnit': weightUnitTypeToString(instance.weightUnit),
      'tonnage': instance.tonnage,
      'ownerId': instance.ownerId,
      'status': postStatusTypeToString(instance.status),
      'approvedAt': instance.approvedAt?.toIso8601String(),
      'rejectedAt': instance.rejectedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'pickupProvinces': instance.pickupProvinces,
      'deliveryProvinces': instance.deliveryProvinces,
    };

PostMetaData _$PostMetaDataFromJson(Map<String, dynamic> json) => PostMetaData(
      totalElements: json['totalElements'] as int? ?? 0,
      totalPages: json['totalPages'] as int? ?? 0,
      page: json['page'] as int? ?? 0,
      size: json['size'] as int? ?? 0,
    );

Map<String, dynamic> _$PostMetaDataToJson(PostMetaData instance) =>
    <String, dynamic>{
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
      'page': instance.page,
      'size': instance.size,
    };
