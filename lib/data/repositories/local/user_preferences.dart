import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const String tokenKey = 'token';
  static const String isMitra = 'is_mitra';

  static Future<void> saveToken(String token, bool is_mitra) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(tokenKey, token);
    await prefs.setBool(isMitra, is_mitra);
  }

  static Future<Map<String, dynamic>> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString(tokenKey);
    final bool? is_mitra = prefs.getBool(isMitra);

    if (token != null && isMitra != null) {
      return {
        'token': token,
        'is_mitra': is_mitra,
      };
    } else {
      return {
        'token': null,
        'is_mitra': false,
      };
    }
  }

  static Future<void> removeToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(tokenKey);
    await prefs.remove(isMitra);
  }
}
