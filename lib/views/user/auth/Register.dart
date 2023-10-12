import 'package:flutter/material.dart';
import 'package:mobile_laundy_apps/const/Constants.dart';
import 'package:mobile_laundy_apps/utils/GetScreenSize.dart';
import 'package:mobile_laundy_apps/views/user/auth/AuthCheck.dart';
import 'package:mobile_laundy_apps/views/widgets/CustomButton.dart';
import 'package:mobile_laundy_apps/views/widgets/CustomDividerWithText.dart';
import 'package:mobile_laundy_apps/views/widgets/CustomInputField.dart';

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
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              color: Theme.of(context).colorScheme.primary,
              height: GetScreenSize().getScreenHeight(context),
            ),
            Positioned(
              top: 25,
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
                padding: const EdgeInsets.all(36.0),
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
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Mohon isi semua kolom dengan benar",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                color: Theme.of(context).colorScheme.error),
                          ),
                          const SizedBox(height: 15),
                          CustomInputField()
                              .setController(nameController)
                              .setLabel("Nama")
                              .setLabelFontSize(15)
                              .setIcon(const Icon(Icons.person_outline))
                              .build(context),
                          CustomInputField()
                              .setController(emailController)
                              .setLabel("Email")
                              .setLabelFontSize(15)
                              .setIcon(const Icon(Icons.email_outlined))
                              .build(context),
                          CustomInputField()
                              .setController(passwordController)
                              .setLabel("Password")
                              .setLabelFontSize(15)
                              .setIcon(const Icon(Icons.lock_outline))
                              .setObscureText(true)
                              .build(context),
                          SizedBox(
                            width: GetScreenSize().getScreenWidth(context),
                            child: CustomButton()
                                .setLabel("Daftar")
                                .setOnPressed(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AuthCheck(
                                          name: nameController.text,
                                          email: emailController.text)));
                            }).build(context),
                          ),
                          const SizedBox(height: 10),
                          CustomDividerWithText()
                              .setLabel("Atau masuk dengan email")
                              .build(context)
                        ],
                      ),
                    );
                  } else {
                    /*Implement bigger screen size*/
                    return TextLorem(context);
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

Widget TextLorem(BuildContext context) {
  return Column(
    children: [
      Container(child: Text(Constants().loremIpsum)),
      Container(child: Text(Constants().loremIpsum)),
    ],
  );
}
