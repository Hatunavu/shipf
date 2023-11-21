// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaModel _$MediaModelFromJson(Map<String, dynamic> json) => MediaModel(
      title: json['title'] as String?,
      path: json['path'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$MediaModelToJson(MediaModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'path': instance.path,
      'type': instance.type,
    };
