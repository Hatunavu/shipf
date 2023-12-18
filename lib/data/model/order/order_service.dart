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
  final int status;
  final String message;

  OrderServiceResponse(
      {this.data = const [],
      this.success = false,
      this.message = '',
      this.status = 0});

  factory OrderServiceResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderServiceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderServiceResponseToJson(this);
}

@JsonSerializable()
class OrderServiceData {
  final int id;
  final String code;
  final String name;
  final String type;
  final int urbanPickupCharge;
  final int urbanDeliveryCharge;
  final int townPickupCharge;
  final int townDeliveryCharge;
  final int loadingCharge;
  final String returnChargeUnit;
  final int returnCharge;
  final double insuranceCharge;
  final int insuranceValue;
  final int minFreightCharge;
  final int leadTime;
  final bool isActive;
  final Charges? charges;
  // final List<Null> priceListCustomers;
  // final List<Null> priceListCarriers;
  // final List<Null> priceListSteps;

  OrderServiceData(
      {this.id = 0,
      this.code = '',
      this.name = '',
      this.type = '',
      this.urbanPickupCharge = 0,
      this.urbanDeliveryCharge = 0,
      this.townPickupCharge = 0,
      this.townDeliveryCharge = 0,
      this.loadingCharge = 0,
      this.returnChargeUnit = '',
      this.returnCharge = 0,
      this.insuranceCharge = 0,
      this.insuranceValue = 0,
      this.minFreightCharge = 0,
      this.leadTime = 0,
      this.isActive = false,
      this.charges
      // this.priceListCustomers = const [],
      // this.priceListCarriers = const [],
      // this.priceListSteps = const [],
      });

  factory OrderServiceData.fromJson(Map<String, dynamic> json) =>
      _$OrderServiceDataFromJson(json);

  Map<String, dynamic> toJson() => _$OrderServiceDataToJson(this);
}

@JsonSerializable()
class Charges {
  final int freightCharge;
  final int loadingCharge;
  final int insuranceCharge;
  final int returnCharge;
  final int pickupCharge;
  final int deliveryCharge;

  Charges(
      {this.freightCharge = 0,
      this.loadingCharge = 0,
      this.insuranceCharge = 0,
      this.returnCharge = 0,
      this.pickupCharge = 0,
      this.deliveryCharge = 0});

  factory Charges.fromJson(Map<String, dynamic> json) =>
      _$ChargesFromJson(json);

  Map<String, dynamic> toJson() => _$ChargesToJson(this);
}
