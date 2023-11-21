import 'package:json_annotation/json_annotation.dart';
import 'package:shipf/data/model/account/account_model.dart';

part 'user_session.g.dart';

@JsonSerializable()
class UserSession {
  UserSession({
    required this.token,
    required this.userId,
    required this.user,
    required this.status,
  });
  final String token;
  final String userId;
  final Account? user;
  final int status;

  factory UserSession.fromJson(Map<String, dynamic> json) =>
      _$UserSessionFromJson(json);
  Map<String, dynamic> toJson() => _$UserSessionToJson(this);
}
