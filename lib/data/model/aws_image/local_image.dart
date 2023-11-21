import 'package:shipf/data/model/aws_image/aws_image.dart';

class LocalImage {
  final String? name;
  final String? resource;
  final AwsImage awsImage;
  final String? type;
  final String? path;

  LocalImage(
      {this.name, this.resource, required this.awsImage, this.type, this.path});
}

class LocalImagePick {
  final String name;
  final String fileType;
  final String resource;
  final String? type;
  LocalImagePick(
      {required this.name,
      required this.fileType,
      required this.resource,
      this.type});
}
