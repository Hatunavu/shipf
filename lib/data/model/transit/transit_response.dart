import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shipf/data/model/shipment/shipment_response.dart';
import 'package:shipf/enums/enum_loading_type.dart';
import 'package:shipf/enums/enum_transit_status.dart';
import 'package:shipf/foundation/extension/date_formatting.dart';

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
  final int pickupZoneId;
  final int deliveryZoneId;
  final String code;
  @JsonKey(
      name: 'type', toJson: loadingTypeToString, fromJson: stringToLoadingType)
  final LoadingType type;
  @JsonKey(
      name: 'status',
      toJson: transitStatusToString,
      fromJson: stringToTransitStatus)
  final TransitStatus status;
  final String note;
  final int totalShipments;
  final int totalShipperCharge;
  final String doneAt;
  final DateTime? createdAt;
  final TransitDataZone? pickupZone;
  final TransitDataZone? deliveryZone;
  final List<TransitShipper> transitShippers;
  final TransitDataCustomer? customer;
  final List<ShipmentData> shipments;
  TransitData(
      {this.id = 0,
      this.operatorId = 0,
      this.carrierId = 0,
      this.fromWarehouseId = 0,
      this.toWarehouseId = 0,
      this.pickupZoneId = 0,
      this.deliveryZoneId = 0,
      this.code = '',
      this.type = LoadingType.pickup,
      this.status = TransitStatus.neww,
      this.note = '',
      this.totalShipments = 0,
      this.totalShipperCharge = 0,
      this.doneAt = '',
      this.createdAt,
      this.transitShippers = const [],
      this.pickupZone,
      this.deliveryZone,
      this.customer,
      this.shipments = const []});

  String get createdTime {
    if (createdAt == null) return '';
    return DateFormatting(createdAt!).tohhmmddMMyyyy();
  }

  String get totalFee {
    return NumberFormat.decimalPattern().format(totalShipperCharge).toString();
  }

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
  final DateTime? createdAt;
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
      this.createdAt,
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

@JsonSerializable()
class TransitDetail {
  final String message;
  final bool success;
  final int status;
  final TransitData? data;

  TransitDetail({
    this.message = '',
    this.status = 0,
    this.success = false,
    this.data,
  });

  factory TransitDetail.fromJson(Map<String, dynamic> json) =>
      _$TransitDetailFromJson(json);
  Map<String, dynamic> toJson() => _$TransitDetailToJson(this);
}

@JsonSerializable()
class TransitDataZone {
  final int id;
  final int provinceId;
  final int districtId;
  final int wardId;
  final String fullAddress;
  final String code;
  final String type;
  final bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  TransitDataZone(
      {this.id = 0,
      this.provinceId = 0,
      this.districtId = 0,
      this.wardId = 0,
      this.fullAddress = '',
      this.code = '',
      this.type = '',
      this.isActive = false,
      this.createdAt,
      this.updatedAt});

  factory TransitDataZone.fromJson(Map<String, dynamic> json) =>
      _$TransitDataZoneFromJson(json);
  Map<String, dynamic> toJson() => _$TransitDataZoneToJson(this);
}

@JsonSerializable()
class TransitDataCustomer {
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
  final DateTime? createdAt;
  final DateTime? updatedAt;

  TransitDataCustomer(
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
      this.createdAt,
      this.updatedAt});

  factory TransitDataCustomer.fromJson(Map<String, dynamic> json) =>
      _$TransitDataCustomerFromJson(json);
  Map<String, dynamic> toJson() => _$TransitDataCustomerToJson(this);
}
