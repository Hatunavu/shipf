import 'package:shipf/ui/services/shared_preferences.dart';

class AccountServices {
  final _box = SharedPreferencesService();
  final _tokenKey = "userToken";
  final _userIdKey = "userIdKey";
  final _accountType = "accountType";
  final _accountLanguage = "accountLanguage";
  final _isFirstLoad = "_firstLoad";
  final _notificationToken = "notificationToken";
  final _username = "username";

  Future<String> getUserToken() async => await _box.getString(_tokenKey) ?? "";
  Future<String> getUserId() async => await _box.getString(_userIdKey) ?? "";
  Future<String> getAccountType() async =>
      await _box.getString(_accountType) ?? "";
  Future<String> getAccountLanguage() async =>
      await _box.getString(_accountLanguage) ?? "";
  Future<bool> getIsFirstLoad() async =>
      await _box.getBool(_isFirstLoad) ?? false;

  Future<String> getNotificationToken() async =>
      await _box.getString(_notificationToken) ?? "";
  Future<String> getUsername() async => await _box.getString(_username) ?? "";

  saveUserToken(String token) => _box.setString(_tokenKey, token);
  saveUserId(String userId) => _box.setString(_userIdKey, userId);
  saveAccountType(String type) => _box.setString(_accountType, type);
  saveAccountLanguage(String type) => _box.setString(_accountLanguage, type);
  saveIsFirstLoad(bool status) => _box.setBool(_isFirstLoad, status);
  saveNotificationToken(String token) =>
      _box.setString(_notificationToken, token);
  saveUsername(String username) => _box.setString(_username, username);
}
