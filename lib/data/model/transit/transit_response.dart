import 'package:json_annotation/json_annotation.dart';
import 'package:shipf/enums/enum_loading_type.dart';
import 'package:shipf/enums/enum_shipment_status.dart';

part 'transit_response.g.dart';

@JsonSerializable()
class TransitResponse {
  final String message;
  final bool success;
  final int status;
  final List<TransitData> data;
  final TransitMetaData? metadata;
  TransitResponse(
      {this.message = '',
      this.status = 0,
      this.success = false,
      this.data = const [],
      this.metadata});

  factory TransitResponse.fromJson(Map<String, dynamic> json) =>
      _$TransitResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TransitResponseToJson(this);
}

@JsonSerializable()
class TransitData {
  final int id;
  final int operatorId;
  final int carrierId;
  final int fromWarehouseId;
  final int toWarehouseId;
  final String code;
  @JsonKey(
      name: 'type', toJson: loadingTypeToString, fromJson: stringToLoadingType)
  final LoadingType type;
  @JsonKey(
      name: 'status',
      toJson: shipmentStatusToString,
      fromJson: stringToShipmentStatus)
  final ShipmentStatus status;
  final String note;
  final String doneAt;
  final String createdAt;
  final List<TransitShipper> transitShippers;
  TransitData(
      {this.id = 0,
      this.operatorId = 0,
      this.carrierId = 0,
      this.fromWarehouseId = 0,
      this.toWarehouseId = 0,
      this.code = '',
      this.type = LoadingType.pickup,
      this.status = ShipmentStatus.neww,
      this.note = '',
      this.doneAt = '',
      this.createdAt = '',
      this.transitShippers = const []});

  factory TransitData.fromJson(Map<String, dynamic> json) =>
      _$TransitDataFromJson(json);
  Map<String, dynamic> toJson() => _$TransitDataToJson(this);
}

@JsonSerializable()
class TransitShipper {
  final int id;
  final int transitId;
  final int shipperId;
  final String note;
  final String acceptedAt;
  final String canceledAt;
  final String finishedAt;
  final Shipper? shipper;

  TransitShipper(
      {this.id = 0,
      this.transitId = 0,
      this.shipperId = 0,
      this.note = '',
      this.acceptedAt = '',
      this.canceledAt = '',
      this.finishedAt = '',
      this.shipper});

  factory TransitShipper.fromJson(Map<String, dynamic> json) =>
      _$TransitShipperFromJson(json);
  Map<String, dynamic> toJson() => _$TransitShipperToJson(this);
}

@JsonSerializable()
class Shipper {
  final int id;
  final int userConfigId;
  final int roleId;
  final int parentId;
  final String code;
  final String name;
  final String phone;
  final String email;
  final String termAndConditionAcceptedAt;
  final bool isActive;
  final String createdAt;
  final String updatedAt;
  final String deletedAt;

  Shipper(
      {this.id = 0,
      this.userConfigId = 0,
      this.roleId = 0,
      this.parentId = 0,
      this.code = '',
      this.name = '',
      this.phone = '',
      this.email = '',
      this.termAndConditionAcceptedAt = '',
      this.isActive = false,
      this.createdAt = '',
      this.updatedAt = '',
      this.deletedAt = ''});

  factory Shipper.fromJson(Map<String, dynamic> json) =>
      _$ShipperFromJson(json);
  Map<String, dynamic> toJson() => _$ShipperToJson(this);
}

@JsonSerializable()
class TransitMetaData {
  final int totalElements;
  final int totalPages;
  final int page;
  final int size;

  TransitMetaData(
      {this.totalElements = 0,
      this.totalPages = 0,
      this.page = 0,
      this.size = 0});

  factory TransitMetaData.fromJson(Map<String, dynamic> json) =>
      _$TransitMetaDataFromJson(json);
  Map<String, dynamic> toJson() => _$TransitMetaDataToJson(this);
}
