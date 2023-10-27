import 'package:WashWoosh/data/models/auth/mitra_data.dart';
import 'package:WashWoosh/dummy.dart';
import 'package:WashWoosh/views/auth/auth_check.dart';
import 'package:WashWoosh/views/auth/user_login.dart';
import 'package:WashWoosh/views/auth/welcome.dart';
import 'package:WashWoosh/views/mitra/mitra_auth/mitra_register.dart';
import 'package:WashWoosh/views/mitra/mitra_auth/mitra_register_laundry.dart';
import 'package:WashWoosh/views/mitra/mitra_dashboard.dart';
import 'package:WashWoosh/views/mitra/mitra_detail_order.dart';
import 'package:WashWoosh/views/shadow_page.dart';
import 'package:WashWoosh/views/splash_screen.dart';
import 'package:WashWoosh/views/under_construction.dart';
import 'package:WashWoosh/views/user/user_auth/user_register.dart';
import 'package:WashWoosh/views/user/user_dashboard.dart';
import 'package:WashWoosh/views/user/user_laundry/user_laundry_detail.dart';
import 'package:WashWoosh/views/user/user_laundry/user_laundry_list.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = '/';
  static const String welcomeScreen = '/welcome';
  static const String shadowPage = '/shadow';

  /*Authentication*/
  static const String authCheck = '/auth-check';
  static const String userLogin = '/user-login';
  static const String userRegister = '/user-register';
  static const String mitraRegister = '/mitra-register';
  static const String mitraRegisterLaundry = '/mitra-register-laundry';

  /*Dashboard*/
  static const String userDashboard = '/user-dashboard';
  static const String userLaundryList = '/user-laundry-list';
  static const String userLaundryDetail = '/user-laundry-detail';

  /*Mitra*/
  static const String mitraDashboard = '/mitra-dashboard';
  static const String mitraDetailOrder = '/mitra-detail-order';
  static const String dummy = '/dummy';

  static const String underConstruction = '/under-construction';
  static final Map<String, WidgetBuilder> routes = {
    home: (context) => const SplashScreen(),
    shadowPage: (context) => const ShadowPage(),
    welcomeScreen: (context) => const Welcome(),
    authCheck: (context) => const AuthCheck(),
    userLogin: (context) => const UserLogin(),
    userRegister: (context) => const UserRegister(),
    mitraRegister: (context) => const MitraRegister(),
    mitraRegisterLaundry: (context) => MitraRegisterLaundry(
        mitraData: ModalRoute.of(context)!.settings.arguments as MitraData),
    userDashboard: (context) => const UserDashboard(),
    userLaundryList: (context) => const LaundryList(),
    userLaundryDetail: (context) => const UserLaundryDetail(),
    mitraDashboard: (context) => const MitraDashboard(),
    dummy: (context) => const Dummy(),
    mitraDetailOrder: (context) => const MitraDetailOrder(),
    underConstruction: (context) => const UnderConstruction(),
  };
}
