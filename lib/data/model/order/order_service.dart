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
