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
    );

Map<String, dynamic> _$PostResponseToJson(PostResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
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
    };
