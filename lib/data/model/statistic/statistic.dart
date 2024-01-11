import 'package:json_annotation/json_annotation.dart';

part 'statistic.g.dart';

@JsonSerializable()
class Statistic {
  final String content;
  final String data;
  final String color;

  Statistic({this.content = '', this.data = '', this.color = ''});

  factory Statistic.fromJson(Map<String, dynamic> json) =>
      _$StatisticFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticToJson(this);
}

class HomeAction {
  final String content;
  final String icon;
  final Function()? onTap;

  HomeAction({this.content = '', this.icon = '', this.onTap});

  // factory HomeAction.fromJson(Map<String, dynamic> json) =>
  //     _$HomeActionFromJson(json);

  // Map<String, dynamic> toJson() => _$HomeActionToJson(this);
}
