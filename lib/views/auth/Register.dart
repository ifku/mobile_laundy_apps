import 'package:flutter/material.dart';
import 'package:mobile_laundy_apps/const/Constants.dart';
import 'package:mobile_laundy_apps/utils/GetScreenSize.dart';
import 'package:mobile_laundy_apps/views/auth/AuthCheck.dart';
import 'package:mobile_laundy_apps/views/widgets/InputField.dart';

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
  TextEditingController password2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Register")),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth > 300) {
                return Column(
                  children: [
                    InputField()
                        .setController(nameController)
                        .setLabel("Name")
                        .setLabelFontSize(15)
                        .setLabelSpacing(10)
                        .build(context),
                    InputField()
                        .setController(emailController)
                        .setLabel("Email")
                        .setLabelFontSize(15)
                        .setLabelSpacing(10)
                        .build(context),
                    InputField()
                        .setController(passwordController)
                        .setLabel("Password")
                        .setLabelFontSize(15)
                        .setLabelSpacing(10)
                        .build(context),
                    InputField()
                        .setController(password2Controller)
                        .setLabel("Re-type Password")
                        .setLabelFontSize(15)
                        .setLabelSpacing(10)
                        .build(context),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: GetScreenSize().getScreenWidth(context),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AuthCheck(
                                          name: nameController.text,
                                          email: emailController.text)));
                            },
                            child: const Text("Next")))
                  ],
                );
              } else {
                /*Implement bigger screen size*/
                return TextLorem(context);
              }
            }),
          ),
        ));
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
