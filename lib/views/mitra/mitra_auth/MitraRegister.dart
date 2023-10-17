import 'package:flutter/material.dart';
import 'package:mobile_laundy_apps/utils/GetScreenSize.dart';
import 'package:mobile_laundy_apps/views/mitra/mitra_auth/MitraRegisterLaundry.dart';
import 'package:mobile_laundy_apps/views/widgets/CustomButton.dart';
import 'package:mobile_laundy_apps/views/widgets/CustomDividerWithText.dart';
import 'package:mobile_laundy_apps/views/widgets/CustomInputField.dart';
import 'package:mobile_laundy_apps/views/widgets/CustomGoogleOutlinedButton.dart';
import 'package:mobile_laundy_apps/views/widgets/CustomTextArea.dart';

class MitraRegister extends StatefulWidget {
  const MitraRegister({super.key});

  @override
  State<MitraRegister> createState() => _MitraRegisterState();
}

class _MitraRegisterState extends State<MitraRegister> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    phoneController.dispose();
    passwordController.dispose();
  }

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
          Container(
            height: MediaQuery.of(context).size.height * 0.9,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
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
                        // CustomTextArea()
                        //     .setSizedBoxHeight(20)
                        //     .setIcon(const Icon(Icons.location_on_outlined))
                        //     .setLabel("Alamat Laundry")
                        //     .build(context),
                        CustomInputField()
                            .setController(phoneController)
                            .setLabel("No.Telepon")
                            .setLabelFontSize(15)
                            .setKeyboardType(TextInputType.phone)
                            .setIcon(const Icon(Icons.call_outlined))
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
                          child: CustomButton()
                              .setLabel("Selanjutnya")
                              .setOnPressed(
                            () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MitraRegisterLaundry()));
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
          Positioned(
            top: 10,
            height: 104,
            width: 104,
            child: Image.asset("lib/assets/images/wireframe.png"),
          ),
        ],
      ),
    ));
  }
}
