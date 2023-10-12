import 'package:flutter/material.dart';
import 'package:mobile_laundy_apps/Theme.dart';
import 'package:mobile_laundy_apps/views/user/auth/Register.dart';

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
        fontFamily: "Lato",
        colorScheme: ColorScheme.light(
          primary: CustomTheme().primaryColor,
          secondary: CustomTheme().secondaryColor,
          onSecondary: Colors.white,
        ),
        brightness: Brightness.light,
      ),
      home: const Register(),
    );
  }
}
