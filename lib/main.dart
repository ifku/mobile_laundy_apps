import 'package:WashWoosh/bloc/bloc_providers.dart';
import 'package:WashWoosh/dummy.dart';
import 'package:WashWoosh/routes/routes.dart';
import 'package:WashWoosh/theme.dart';
import 'package:WashWoosh/views/widgets/custom_detail.dart';
import 'package:WashWoosh/views/widgets/custom_order_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting('id');
  runApp(
    MultiBlocProvider(
      providers: BlocProviders.getProviders(),
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
      // home: Scaffold(body: Center(child: CustomDetail(tanggalPemesanan: '2021-10-20', estimasiPemesanan: '2021-10-20', hargaTotal: 20000, isDibayar: true,))),
    );
  }
}
