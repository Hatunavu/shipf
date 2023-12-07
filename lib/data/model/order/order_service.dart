import 'package:json_annotation/json_annotation.dart';

part 'order_service.g.dart';

@JsonSerializable()
class OrderService {
  final int id;
  String name;
  final String type;
  final String fee;
  bool isSelect;

  OrderService(
      {this.name = '',
      this.fee = '',
      this.type = '',
      this.isSelect = false,
      this.id = 0});

  factory OrderService.fromJson(Map<String, dynamic> json) =>
      _$OrderServiceFromJson(json);

  Map<String, dynamic> toJson() => _$OrderServiceToJson(this);
}

@JsonSerializable()
class OrderServiceResponse {
  final List<OrderServiceData> data;
  final bool success;

  OrderServiceResponse({this.data = const [], this.success = false});

  factory OrderServiceResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderServiceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderServiceResponseToJson(this);
}

@JsonSerializable()
class OrderServiceData {
  PriceList? priceList;
  Fee? fee;

  OrderServiceData({this.priceList, this.fee});

  factory OrderServiceData.fromJson(Map<String, dynamic> json) =>
      _$OrderServiceDataFromJson(json);

  Map<String, dynamic> toJson() => _$OrderServiceDataToJson(this);
}

@JsonSerializable()
class PriceList {
  final int id;
  final bool isActive;
  final String createdAt;
  final String name;
  final String type;
  final int suburbanPickFee;
  final int countryPickFee;
  final int suburbanDelFee;
  final int countryDelFee;
  final int loadFee;
  final String returnFeeUnit;
  final int returnFeeValue;
  final double insuranceFee;
  final int insuranceValue;
  final int minValue;
  final int leadTime;
  final int ownerId;
  final int fromRegionId;
  final int toRegionId;

  PriceList(
      {this.id = 0,
      this.isActive = false,
      this.createdAt = '',
      this.name = '',
      this.type = '',
      this.suburbanPickFee = 0,
      this.countryPickFee = 0,
      this.suburbanDelFee = 0,
      this.countryDelFee = 0,
      this.loadFee = 0,
      this.returnFeeUnit = '',
      this.returnFeeValue = 0,
      this.insuranceFee = 0,
      this.insuranceValue = 0,
      this.minValue = 0,
      this.leadTime = 0,
      this.ownerId = 0,
      this.fromRegionId = 0,
      this.toRegionId = 0});

  factory PriceList.fromJson(Map<String, dynamic> json) =>
      _$PriceListFromJson(json);

  Map<String, dynamic> toJson() => _$PriceListToJson(this);
}

@JsonSerializable()
class Fee {
  final int serviceFee;
  final int insuranceFee;
  final int returnFee;
  final int regionPickFee;
  final int regionDeliverFee;
  final int codFee;
  final int loadFee;
  final int totalFee;

  Fee(
      {this.serviceFee = 0,
      this.insuranceFee = 0,
      this.returnFee = 0,
      this.regionPickFee = 0,
      this.regionDeliverFee = 0,
      this.codFee = 0,
      this.loadFee = 0,
      this.totalFee = 0});

  factory Fee.fromJson(Map<String, dynamic> json) => _$FeeFromJson(json);

  Map<String, dynamic> toJson() => _$FeeToJson(this);
}
