import 'dart:convert';

import 'package:WashWoosh/data/models/auth/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const String tokenKey = 'token';
  static const String isMitra = 'is_mitra';
  static const String userDataKey = 'user_data';


  static Future<void> saveToken(String token, bool is_mitra) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(tokenKey, token);
    await prefs.setBool(isMitra, is_mitra);
  }

  static Future<Map<String, dynamic>> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString(tokenKey);
    final bool? is_mitra = prefs.getBool(isMitra);

    if (token != null && is_mitra != null) {
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

  static Future<void> saveUserData(UserData userData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userDataJson = jsonEncode(userData.toJson());
    await prefs.setString(userDataKey, userDataJson);
  }

  static Future<UserData?> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userDataJson = prefs.getString(userDataKey);

    if (userDataJson != null) {
      final Map<String, dynamic> userDataMap = jsonDecode(userDataJson);
      return UserData.fromJson(userDataMap);
    } else {
      return null;
    }
  }

  static Future<void> removeUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(userDataKey);
  }
}
