// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transit_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransitResponse _$TransitResponseFromJson(Map<String, dynamic> json) =>
    TransitResponse(
      message: json['message'] as String? ?? '',
      status: json['status'] as int? ?? 0,
      success: json['success'] as bool? ?? false,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => TransitData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      metadata: json['metadata'] == null
          ? null
          : TransitMetaData.fromJson(json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransitResponseToJson(TransitResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
      'metadata': instance.metadata,
    };

TransitData _$TransitDataFromJson(Map<String, dynamic> json) => TransitData(
      id: json['id'] as int? ?? 0,
      operatorId: json['operatorId'] as int? ?? 0,
      carrierId: json['carrierId'] as int? ?? 0,
      fromWarehouseId: json['fromWarehouseId'] as int? ?? 0,
      toWarehouseId: json['toWarehouseId'] as int? ?? 0,
      code: json['code'] as String? ?? '',
      type: json['type'] == null
          ? LoadingType.pickup
          : stringToLoadingType(json['type'] as String),
      status: json['status'] == null
          ? ShipmentStatus.neww
          : stringToShipmentStatus(json['status'] as String),
      note: json['note'] as String? ?? '',
      doneAt: json['doneAt'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
      transitShippers: (json['transitShippers'] as List<dynamic>?)
              ?.map((e) => TransitShipper.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      shipments: (json['shipments'] as List<dynamic>?)
              ?.map((e) => ShipmentData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TransitDataToJson(TransitData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'operatorId': instance.operatorId,
      'carrierId': instance.carrierId,
      'fromWarehouseId': instance.fromWarehouseId,
      'toWarehouseId': instance.toWarehouseId,
      'code': instance.code,
      'type': loadingTypeToString(instance.type),
      'status': shipmentStatusToString(instance.status),
      'note': instance.note,
      'doneAt': instance.doneAt,
      'createdAt': instance.createdAt,
      'transitShippers': instance.transitShippers,
      'shipments': instance.shipments,
    };

TransitShipper _$TransitShipperFromJson(Map<String, dynamic> json) =>
    TransitShipper(
      id: json['id'] as int? ?? 0,
      transitId: json['transitId'] as int? ?? 0,
      shipperId: json['shipperId'] as int? ?? 0,
      note: json['note'] as String? ?? '',
      acceptedAt: json['acceptedAt'] as String? ?? '',
      canceledAt: json['canceledAt'] as String? ?? '',
      finishedAt: json['finishedAt'] as String? ?? '',
      shipper: json['shipper'] == null
          ? null
          : Shipper.fromJson(json['shipper'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransitShipperToJson(TransitShipper instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transitId': instance.transitId,
      'shipperId': instance.shipperId,
      'note': instance.note,
      'acceptedAt': instance.acceptedAt,
      'canceledAt': instance.canceledAt,
      'finishedAt': instance.finishedAt,
      'shipper': instance.shipper,
    };

Shipper _$ShipperFromJson(Map<String, dynamic> json) => Shipper(
      id: json['id'] as int? ?? 0,
      userConfigId: json['userConfigId'] as int? ?? 0,
      roleId: json['roleId'] as int? ?? 0,
      parentId: json['parentId'] as int? ?? 0,
      code: json['code'] as String? ?? '',
      name: json['name'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      email: json['email'] as String? ?? '',
      termAndConditionAcceptedAt:
          json['termAndConditionAcceptedAt'] as String? ?? '',
      isActive: json['isActive'] as bool? ?? false,
      createdAt: json['createdAt'] as String? ?? '',
      updatedAt: json['updatedAt'] as String? ?? '',
      deletedAt: json['deletedAt'] as String? ?? '',
    );

Map<String, dynamic> _$ShipperToJson(Shipper instance) => <String, dynamic>{
      'id': instance.id,
      'userConfigId': instance.userConfigId,
      'roleId': instance.roleId,
      'parentId': instance.parentId,
      'code': instance.code,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'termAndConditionAcceptedAt': instance.termAndConditionAcceptedAt,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
    };

TransitMetaData _$TransitMetaDataFromJson(Map<String, dynamic> json) =>
    TransitMetaData(
      totalElements: json['totalElements'] as int? ?? 0,
      totalPages: json['totalPages'] as int? ?? 0,
      page: json['page'] as int? ?? 0,
      size: json['size'] as int? ?? 0,
    );

Map<String, dynamic> _$TransitMetaDataToJson(TransitMetaData instance) =>
    <String, dynamic>{
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
      'page': instance.page,
      'size': instance.size,
    };

TransitDetail _$TransitDetailFromJson(Map<String, dynamic> json) =>
    TransitDetail(
      message: json['message'] as String? ?? '',
      status: json['status'] as int? ?? 0,
      success: json['success'] as bool? ?? false,
      data: json['data'] == null
          ? null
          : TransitData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransitDetailToJson(TransitDetail instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };
