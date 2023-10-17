import 'package:flutter/material.dart';
import 'package:mobile_laundy_apps/utils/GetScreenSize.dart';
import 'package:mobile_laundy_apps/views/mitra/mitra_auth/MitraRegister.dart';
import 'package:mobile_laundy_apps/views/widgets/CustomButton.dart';
import 'package:mobile_laundy_apps/views/widgets/CustomOutlinedButton.dart';

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
              width: GetScreenSize().getScreenWidth(context),
              child: CustomButton()
                  .setLabel("Masuk Sebagai Pengguna")
                  .setOnPressed(() {})
                  .build(context),
            ),
            const SizedBox(height: 20),
            CustomOutlinedButton()
                .setLabel("Masuk Sebagai Mitra")
                .setFontSize(15)
                .setOnPressed(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MitraRegister()));
            })
                .build(context),
          ],
        ),
      ),
    );
  }
}
