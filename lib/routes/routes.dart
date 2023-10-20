import 'package:flutter/material.dart';
import 'package:mobile_laundy_apps/dummy.dart';
import 'package:mobile_laundy_apps/views/auth/auth_check.dart';
import 'package:mobile_laundy_apps/views/auth/user_login.dart';
import 'package:mobile_laundy_apps/views/auth/welcome.dart';
import 'package:mobile_laundy_apps/views/mitra/mitra_auth/mitra_register.dart';
import 'package:mobile_laundy_apps/views/mitra/mitra_auth/mitra_register_laundry.dart';
import 'package:mobile_laundy_apps/views/mitra/mitra_dashboard.dart';
import 'package:mobile_laundy_apps/views/splash_screen.dart';
import 'package:mobile_laundy_apps/views/user/user_auth/user_register.dart';
import 'package:mobile_laundy_apps/views/user/user_dashboard.dart';

class AppRoutes {
  static const String home = '/';
  static const String welcomeScreen = '/welcome';

  /*Authentication*/
  static const String authCheck = '/auth-check';
  static const String userLogin = '/user-login';
  static const String userRegister = '/user-register';
  static const String mitraRegister = '/mitra-register';
  static const String mitraRegisterLaundry = '/mitra-register-laundry';

  /*Dashboard*/
  static const String userDashboard = '/user-dashboard';
  static const String mitraDashboard = '/mitra-dashboard';
  static const String dummy = '/dummy';
  static final Map<String, WidgetBuilder> routes = {
    home: (context) => const SplashScreen(),
    welcomeScreen: (context) => const Welcome(),
    authCheck: (context) => const AuthCheck(),
    userLogin: (context) => const UserLogin(),
    userRegister: (context) => const UserRegister(),
    mitraRegister: (context) => const MitraRegister(),
    mitraRegisterLaundry: (context) => const MitraRegisterLaundry(),
    userDashboard: (context) => const UserDashboard(),
    mitraDashboard: (context) => const MitraDashboard(),
    dummy: (context) => const Dummy(),
  };
}
