import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper {
  static const _tokenKey = "user_token";

  static Future<void> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_tokenKey, token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  static Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_tokenKey);
  }

  static Future<bool> isUserLoggedIn() async {
    final token = await getToken();
    return token != null;
  }
}
