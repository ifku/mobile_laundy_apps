import 'package:mobile_laundy_apps/data/models/auth/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveLoginData(LoginModel login) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.commit();
  }
}
