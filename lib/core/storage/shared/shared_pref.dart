import 'package:shared_preferences/shared_preferences.dart';

import '../../resource/key_manger.dart';

abstract class AppSharedPreferences {
  static late SharedPreferences _sharedPreferences;

  static init(SharedPreferences sh) {
    _sharedPreferences = sh;
  }

  static clear() {
    _sharedPreferences.clear();
  }

  static void cashUserInfo({
    required String token,
    required String userId,
  }) {
    _sharedPreferences.setString(AppKeyManager.token, token);
    _sharedPreferences.setString(AppKeyManager.userId, userId);
  }

  static cashLanguage({required String language}) {
    _sharedPreferences.setString(AppKeyManager.language, language);
  }

  static cashEmployeeID({required String id}) {
    _sharedPreferences.setString(AppKeyManager.id, id);
  }

  static cashToken({required String token}) {
    _sharedPreferences.setString(AppKeyManager.token, token);
  }

  static String getLanguage() {
    return _sharedPreferences.getString(AppKeyManager.language) ?? "ar";
  }

  static String getEmployeeId() {
    return _sharedPreferences.getString(AppKeyManager.id) ?? "";
  }

  static String getToken() {
    return _sharedPreferences.getString(AppKeyManager.token) ?? '';
  }
}
