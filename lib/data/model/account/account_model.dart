import 'package:json_annotation/json_annotation.dart';

part 'account_model.g.dart';

@JsonSerializable()
class Account {
  @JsonKey(name: '_id')
  final String id;
  final Profile profile;
  final String? phone;
  final String? password;
  final String? type;
  final int? status;
  final AuthenticationModel? authentication;
  final String? address;
  Account(
      {required this.id,
      required this.profile,
      this.phone,
      this.type,
      this.password,
      this.status = 1,
      this.authentication,
      this.address});

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}

@JsonSerializable()
class Profile {
  final String fullName;
  String? avatar;
  final String? email;
  final DateTime? dateOfBirth;

  final String? gender;

  Profile(
      {required this.fullName,
      this.avatar,
      this.email,
      this.dateOfBirth,
      this.gender});

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}

@JsonSerializable()
class AuthenticationModel {
  @JsonKey(name: 'lock', defaultValue: false)
  final bool? lock;
  @JsonKey(name: 'status', defaultValue: false)
  final bool? status;
  final String? ip;
  final DateTime? recentSMSOTP;
  @JsonKey(name: 'isPhoneVerified', defaultValue: false)
  final bool isPhoneVerified;

  AuthenticationModel({
    this.lock,
    this.status,
    this.ip,
    this.recentSMSOTP,
    required this.isPhoneVerified,
  });

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationModelToJson(this);
}
