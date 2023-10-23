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
      Navigator.of(context).pushReplacementNamed(
        AppRoutes.welcomeScreen,
      );
    });
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
