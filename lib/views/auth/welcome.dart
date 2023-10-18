import 'package:flutter/material.dart';
import 'package:mobile_laundy_apps/utils/get_screen_size.dart';
import 'package:mobile_laundy_apps/views/mitra/mitra_auth/mitra_register.dart';
import 'package:mobile_laundy_apps/views/user/user_auth/user_login.dart';
import 'package:mobile_laundy_apps/views/widgets/custom_button.dart';
import 'package:mobile_laundy_apps/views/widgets/custom_outlined_button.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: GetScreenSize.getScreenWidth(context),
              child: CustomButton()
                  .setLabel("Masuk Sebagai Pengguna")
                  .setOnPressed(() {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserLogin()));
                });
              })
                  .build(context),
            ),
            const SizedBox(height: 20),
            CustomOutlinedButton()
                .setLabel("Masuk Sebagai Mitra")
                .setFontSize(15)
                .setOnPressed(() {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MitraRegister()));
              });
            }).build(context),
          ],
        ),
      ),
    );
  }
}
