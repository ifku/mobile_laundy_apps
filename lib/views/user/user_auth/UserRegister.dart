import 'package:flutter/material.dart';
import 'package:mobile_laundy_apps/utils/GetScreenSize.dart';
import 'package:mobile_laundy_apps/views/auth/AuthCheck.dart';
import 'package:mobile_laundy_apps/views/widgets/CustomButton.dart';
import 'package:mobile_laundy_apps/views/widgets/CustomDividerWithText.dart';
import 'package:mobile_laundy_apps/views/widgets/CustomInputField.dart';
import 'package:mobile_laundy_apps/views/widgets/CustomGoogleOutlinedButton.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              color: Theme.of(context).colorScheme.primary,
              height: GetScreenSize().getScreenHeight(context),
            ),
            Positioned(
              top: 40,
              width: 165,
              height: 165,
              child: Image.asset("lib/assets/images/wireframe.png",
                  fit: BoxFit.cover),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 36, left: 36, right: 36),
                child: LayoutBuilder(builder: (context, constraints) {
                  if (constraints.maxWidth > 300) {
                    return SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Yuk, Daftar Akun Barumu!",
                            style: TextStyle(
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Mohon isi semua kolom dengan benar",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(0.5)),
                          ),
                          const SizedBox(height: 15),
                          CustomInputField()
                              .setController(nameController)
                              .setLabel("Nama")
                              .setLabelFontSize(15)
                              .setIcon(const Icon(Icons.person_outline))
                              .setSizedBoxHeight(20)
                              .build(context),
                          CustomInputField()
                              .setController(emailController)
                              .setLabel("Email")
                              .setLabelFontSize(15)
                              .setIcon(const Icon(Icons.email_outlined))
                              .setSizedBoxHeight(20)
                              .build(context),
                          CustomInputField()
                              .setController(passwordController)
                              .setLabel("Password")
                              .setLabelFontSize(15)
                              .setObscureText(true)
                              .setIcon(const Icon(Icons.lock_outline))
                              .setSizedBoxHeight(20)
                              .build(context),
                          SizedBox(
                            width: GetScreenSize().getScreenWidth(context),
                            child:
                                CustomButton().setLabel("Daftar").setOnPressed(
                              () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AuthCheck()));
                              },
                            ).build(context),
                          ),
                          const SizedBox(height: 20),
                          CustomDividerWithText()
                              .setLabel("Atau masuk dengan email")
                              .build(context),
                          const SizedBox(height: 20),
                          CustomGoogleOutlinedButton()
                              .setLabel("Masuk dengan Google")
                              .setSizedBoxHeight(10)
                              .build(context),
                          // const SizedBox(height: 10),
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
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(" di sini",
                                      style: TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary)))
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    /*Implement bigger screen size*/
                    return const Text("Wide");
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
