import 'package:WashWoosh/data/repositories/local/user_preferences.dart';
import 'package:WashWoosh/routes/routes.dart';
import 'package:WashWoosh/utils/get_screen_size.dart';
import 'package:WashWoosh/views/widgets/custom_button.dart';
import 'package:WashWoosh/views/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Hi, Teman Baru!",
                    style: TextStyle(
                      fontFamily: "Lato",
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    )),
                const SizedBox(height: 10),
                Text(
                    "Temukan cara baru untuk mencuci dan tersenyum. Ayo, mulai sekarang!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Lato",
                      fontSize: 15,
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.3),
                    )),
                const SizedBox(height: 30),
                Image.asset(
                    height: 150,
                    width: 150,
                    "lib/assets/images/laundry.png",
                    fit: BoxFit.cover),
                const SizedBox(height: 30),
                SizedBox(
                  width: GetScreenSize.getScreenWidth(context),
                  child: CustomButton()
                      .setLabel("Daftar Sebagai Pengguna")
                      .setOnPressed(() {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.pushNamed(context, AppRoutes.userRegister);
                    });
                  }).build(context),
                ),
                const SizedBox(height: 20),
                CustomOutlinedButton()
                    .setLabel("Daftar Sebagai Mitra")
                    .setFontSize(15)
                    .setOnPressed(() {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.pushNamed(context, AppRoutes.mitraRegister);
                  });
                }).build(context),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sudah punya akun? Masuk aja",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 13,
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(0.5))),
                    InkWell(
                        onTap: () {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            Navigator.pushReplacementNamed(
                                context, AppRoutes.userLogin);
                          });
                        },
                        child: Text(" di sini",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary)))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
