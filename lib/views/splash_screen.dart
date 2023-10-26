import 'package:WashWoosh/data/repositories/local/user_preferences.dart';
import 'package:WashWoosh/routes/routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        opacity = 1.0;
      });
    });

    Future.delayed(const Duration(seconds: 5), () {
      checkIfUserLoggedIn();
      Navigator.of(context).pushReplacementNamed(
        AppRoutes.welcomeScreen,
      );
    });
  }

  Future<void> checkIfUserLoggedIn() async {
    final token = await UserPreferences.getToken();
    final isMitra = token['is_mitra'];
    if (token['token'] != null) {
      if (isMitra) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacementNamed(context, AppRoutes.mitraDashboard);
        });
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacementNamed(context, AppRoutes.userLaundryList);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(seconds: 1),
          curve: Curves.easeIn,
          opacity: opacity,
          child: Image.asset(
            "lib/assets/images/logo-typography.png",
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
