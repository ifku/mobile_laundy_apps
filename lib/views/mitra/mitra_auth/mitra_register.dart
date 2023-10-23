import 'package:WashWoosh/data/models/auth/mitra_data.dart';
import 'package:WashWoosh/routes/routes.dart';
import 'package:WashWoosh/utils/get_screen_size.dart';
import 'package:WashWoosh/views/widgets/custom_button.dart';
import 'package:WashWoosh/views/widgets/custom_divider_with_text.dart';
import 'package:WashWoosh/views/widgets/custom_google_outlined_button.dart';
import 'package:WashWoosh/views/widgets/custom_input_field.dart';
import 'package:WashWoosh/views/widgets/custom_text_area.dart';
import 'package:flutter/material.dart';

class MitraRegister extends StatefulWidget {
  const MitraRegister({super.key});

  @override
  State<MitraRegister> createState() => _MitraRegisterState();
}

class _MitraRegisterState extends State<MitraRegister> {
  TextEditingController nameController = TextEditingController();
  TextEditingController nikController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    nikController.dispose();
    addressController.dispose();
    usernameController.dispose();
    emailController.dispose();
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
            height: GetScreenSize.getScreenHeight(context),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.9,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(36),
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
                            .setController(nikController)
                            .setLabel("NIK")
                            .setLabelFontSize(15)
                            .setIcon(const Icon(Icons.credit_card_outlined))
                            .setSizedBoxHeight(20)
                            .build(context),
                        CustomTextArea()
                            .setController(addressController)
                            .setSizedBoxHeight(20)
                            .setIcon(const Icon(Icons.location_on_outlined))
                            .setLabel("Alamat Laundry")
                            .build(context),
                        CustomInputField()
                            .setController(phoneController)
                            .setLabel("No.Telepon")
                            .setLabelFontSize(15)
                            .setKeyboardType(TextInputType.phone)
                            .setIcon(const Icon(Icons.call_outlined))
                            .setSizedBoxHeight(20)
                            .build(context),
                        CustomInputField()
                            .setController(usernameController)
                            .setLabel("Username")
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
                          width: GetScreenSize.getScreenWidth(context),
                          child: CustomButton()
                              .setLabel("Selanjutnya")
                              .setOnPressed(
                            () {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                Navigator.of(context)
                                    .pushNamed(AppRoutes.mitraRegisterLaundry,
                                        arguments: MitraData(
                                          name: nameController.text,
                                          nik: nikController.text,
                                          address: addressController.text,
                                          phone: phoneController.text,
                                          username: usernameController.text,
                                          email: emailController.text,
                                          password: passwordController.text,
                                        ));
                              });
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
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    Navigator.of(context)
                                        .pushNamed(AppRoutes.userLogin);
                                  });
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
            top: 0,
            height: 104,
            width: 104,
            child: Image.asset("lib/assets/images/iron.png"),
          ),
        ],
      ),
    ));
  }
}
