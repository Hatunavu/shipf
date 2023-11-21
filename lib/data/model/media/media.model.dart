import 'package:json_annotation/json_annotation.dart';

part 'media.model.g.dart';

@JsonSerializable()
class MediaModel {
  final String? title;
  final String path;
  final String type;

  MediaModel({this.title, required this.path, required this.type});

  factory MediaModel.fromJson(Map<String, dynamic> json) =>
      _$MediaModelFromJson(json);

  Map<String, dynamic> toJson() => _$MediaModelToJson(this);
}
