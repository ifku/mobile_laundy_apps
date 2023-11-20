import 'package:WashWoosh/bloc/auth/user_register/user_register_bloc.dart';
import 'package:WashWoosh/data/models/auth/user_register_response_model.dart';
import 'package:WashWoosh/routes/routes.dart';
import 'package:WashWoosh/utils/get_screen_size.dart';
import 'package:WashWoosh/views/widgets/custom_button.dart';
import 'package:WashWoosh/views/widgets/custom_divider_with_text.dart';
import 'package:WashWoosh/views/widgets/custom_google_outlined_button.dart';
import 'package:WashWoosh/views/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserRegisterBloc, UserRegisterState>(
        builder: (context, state) {
          if (state is UserRegisterInitial) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    color: Theme.of(context).colorScheme.primary,
                    height: GetScreenSize.getScreenHeight(context),
                  ),
                  Positioned(
                      top: 50,
                      width: 165,
                      height: 165,
                      child: Image.asset("lib/assets/images/laundry.png",
                          fit: BoxFit.cover)),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 36, left: 36, right: 36),
                      child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Form(
                            key: _formState,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Yuk, Daftar Akun Barumu!",
                                  style: TextStyle(
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
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
                                    .setValidator((value) {
                                      if (value!.isEmpty) {
                                        return "Nama tidak boleh kosong";
                                      }
                                      return null;
                                    })
                                    .setController(nameController)
                                    .setLabel("Nama")
                                    .setLabelFontSize(15)
                                    .setIcon(const Icon(Icons.person_outline))
                                    .setSizedBoxHeight(20)
                                    .build(context),
                                CustomInputField()
                                    .setValidator((value) {
                                      if (value!.isEmpty) {
                                        return "Username tidak boleh kosong";
                                      }
                                      return null;
                                    })
                                    .setController(userNameController)
                                    .setLabel("Username")
                                    .setLabelFontSize(15)
                                    .setIcon(const Icon(Icons.person_outline))
                                    .setSizedBoxHeight(20)
                                    .build(context),
                                CustomInputField()
                                    .setValidator((value) {
                                      RegExp numericRegex = RegExp(r'^[0-9]+$');
                                      if (value!.isEmpty) {
                                        return "No.Telepon tidak boleh kosong";
                                      } else if (!numericRegex
                                              .hasMatch(value) ||
                                          value.length > 12) {
                                        return "No.Telepon tidak valid";
                                      }
                                      return null;
                                    })
                                    .setController(phoneController)
                                    .setLabel("No. Telepon")
                                    .setKeyboardType(TextInputType.number)
                                    .setLabelFontSize(15)
                                    .setIcon(const Icon(Icons.call_outlined))
                                    .setSizedBoxHeight(20)
                                    .build(context),
                                CustomInputField()
                                    .setValidator((value) {
                                      RegExp emailRegex = RegExp(
                                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                      if (value!.isEmpty) {
                                        return "Email tidak boleh kosong";
                                      } else if (!emailRegex.hasMatch(value)) {
                                        return "Email tidak valid";
                                      }
                                      return null;
                                    })
                                    .setController(emailController)
                                    .setLabel("Email")
                                    .setLabelFontSize(15)
                                    .setIcon(const Icon(Icons.email_outlined))
                                    .setSizedBoxHeight(20)
                                    .build(context),
                                CustomInputField()
                                    .setValidator((value) {
                                      if (value!.isEmpty) {
                                        return "Password tidak boleh kosong";
                                      } else if (value.length < 4) {
                                        return "Password tidak boleh kurang dari 4 karakter";
                                      }
                                      return null;
                                    })
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
                                      .setLabel("Daftar")
                                      .setOnPressed(
                                    () {
                                      if (_formState.currentState!.validate()) {
                                        registerButtonPressed(
                                            context,
                                            UserRegisterRequestModel(
                                                name: nameController.text,
                                                noHp: phoneController.text,
                                                rolesId: '2',
                                                email: emailController.text,
                                                userName:
                                                    userNameController.text,
                                                password:
                                                    passwordController.text));
                                      }
                                    },
                                  ).build(context),
                                ),
                                const SizedBox(height: 20),
                                /*CustomDividerWithText()
                              .setLabel("Atau masuk dengan email")
                              .build(context),*/
                                // const SizedBox(height: 20),
                                /*CustomGoogleOutlinedButton()
                              .setLabel("Masuk dengan Google")
                              .setSizedBoxHeight(10)
                              .build(context),*/
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
                          )),
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is UserRegisterLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserRegisterSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              final userRegister = BlocProvider.of<UserRegisterBloc>(context);
              userRegister.add(UserRegisterReset());
              Navigator.of(context).pushNamed(AppRoutes.userLogin);
            });
          }
          if (state is UserRegisterFailure) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              final userRegister = BlocProvider.of<UserRegisterBloc>(context);
              userRegister.add(UserRegisterReset());
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: Colors.red,
                ),
              );
            });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

void registerButtonPressed(
    BuildContext context, UserRegisterRequestModel data) {
  final userRegister = BlocProvider.of<UserRegisterBloc>(context);
  userRegister.add(UserRegisterButtonPressed(
      userRegisterRequestModel: UserRegisterRequestModel(
    name: data.name,
    noHp: data.noHp,
    rolesId: data.rolesId,
    userName: data.userName,
    email: data.email,
    password: data.password,
  )));
}
