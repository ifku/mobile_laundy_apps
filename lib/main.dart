import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_laundy_apps/bloc/auth/login/login_bloc.dart';
import 'package:mobile_laundy_apps/bloc/user/laundry/laundry_list_bloc.dart';
import 'package:mobile_laundy_apps/bloc/user/user_register/user_register_bloc.dart';
import 'package:mobile_laundy_apps/routes/routes.dart';
import 'package:mobile_laundy_apps/theme.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
        BlocProvider<UserRegisterBloc>(create: (context) => UserRegisterBloc()),
        BlocProvider<LaundryListBloc>(create: (context) => LaundryListBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WashWoosh',
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: CustomTheme.primaryColor,
          secondary: CustomTheme.secondaryColor,
          onSecondary: CustomTheme.textWhite,
          onPrimary: CustomTheme.textWhite,
          onBackground: CustomTheme.textBlack,
        ),
        brightness: Brightness.light,
      ),
    );
  }
}
