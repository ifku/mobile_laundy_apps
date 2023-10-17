import 'package:flutter/material.dart';
import 'package:mobile_laundy_apps/Theme.dart';
import 'package:mobile_laundy_apps/views/auth/Welcome.dart';
import 'package:mobile_laundy_apps/views/mitra/mitra_auth/MitraRegister.dart';
import 'package:mobile_laundy_apps/views/user/user_auth/UserLogin.dart';
import 'package:mobile_laundy_apps/views/user/user_auth/UserRegister.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: CustomTheme().primaryColor,
          secondary: CustomTheme().secondaryColor,
          onSecondary: CustomTheme().textWhite,
          onPrimary: CustomTheme().textWhite,
          onBackground: CustomTheme().textBlack,
        ),
        brightness: Brightness.light,
      ),
      home: const MitraRegister(),
    );
  }
}
