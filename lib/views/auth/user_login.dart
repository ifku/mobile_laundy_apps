import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:WashWoosh/bloc/auth/login/login_bloc.dart';
import 'package:WashWoosh/routes/routes.dart';
import 'package:WashWoosh/utils/get_screen_size.dart';
import 'package:WashWoosh/views/mitra/mitra_dashboard.dart';
import 'package:WashWoosh/views/user/user_laundry/user_laundry_list.dart';
import 'package:WashWoosh/views/widgets/custom_button.dart';
import 'package:WashWoosh/views/widgets/custom_input_field.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState();
}


class _UserLoginState extends State<UserLogin> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginSuccess || state is LoginIsMitra) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => state is LoginIsMitra
                    ? const MitraDashboard()
                    : const LaundryList(),
              ),
            );
          });
        }
        return Stack(
          children: [
            Scaffold(
              body: SingleChildScrollView(
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
                      child: Image.asset(
                        "lib/assets/images/laundry-clothes.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 36, left: 36, right: 36),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hai, Selamat Datang!",
                                style: TextStyle(
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
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
                                      .withOpacity(0.5),
                                ),
                              ),
                              const SizedBox(height: 15),
                              CustomInputField()
                                  .setController(nameController)
                                  .setLabel("Email/Username")
                                  .setLabelFontSize(15)
                                  .setIcon(const Icon(Icons.email_outlined))
                                  .setSizedBoxHeight(20)
                                  .build(context),
                              CustomInputField()
                                  .setController(passwordController)
                                  .setLabel("Password")
                                  .setIcon(const Icon(Icons.lock_outline))
                                  .setLabelFontSize(15)
                                  .setObscureText(true)
                                  .build(context),
                              const SizedBox(height: 20),
                              CustomButton()
                                  .setOnPressed(() {
                                    BlocProvider.of<LoginBloc>(context).add(
                                      LoginButtonPressed(
                                        username: nameController.text,
                                        password: passwordController.text,
                                      ),
                                    );
                                  })
                                  .setLabel("Masuk")
                                  .setSizedBoxHeight(20)
                                  .build(context),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Akunnya belum ada nih, mau",
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 13,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        Navigator.of(context)
                                            .pushReplacementNamed(
                                                AppRoutes.welcomeScreen);
                                      });
                                    },
                                    child: Text(
                                      " Daftar ?",
                                      style: TextStyle(
                                        fontFamily: "Inter",
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (state is LoginLoading)
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.6),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
