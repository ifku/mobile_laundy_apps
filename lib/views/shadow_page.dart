import 'package:WashWoosh/data/repositories/local/user_preferences.dart';
import 'package:WashWoosh/routes/routes.dart';
import 'package:flutter/material.dart';

class ShadowPage extends StatefulWidget {
  const ShadowPage({super.key});

  @override
  State<ShadowPage> createState() => _ShadowPageState();
}

class _ShadowPageState extends State<ShadowPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      checkIfUserLoggedIn();
    });
  }

  Future<void> checkIfUserLoggedIn() async {
    final token = await UserPreferences.getToken();
    final isMitra = token?['is_mitra'];
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
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, AppRoutes.welcomeScreen);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
