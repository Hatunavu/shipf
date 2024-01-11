// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Statistic _$StatisticFromJson(Map<String, dynamic> json) => Statistic(
      content: json['content'] as String? ?? '',
      data: json['data'] as String? ?? '',
      color: json['color'] as String? ?? '',
    );

Map<String, dynamic> _$StatisticToJson(Statistic instance) => <String, dynamic>{
      'content': instance.content,
      'data': instance.data,
      'color': instance.color,
    };
