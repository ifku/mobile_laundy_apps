import 'package:WashWoosh/bloc/auth/login/login_bloc.dart';
import 'package:WashWoosh/bloc/auth/mitra_register/mitra_register_bloc.dart';
import 'package:WashWoosh/bloc/auth/user_register/user_register_bloc.dart';
import 'package:WashWoosh/bloc/mitra/mitra_dashboard/mitra_dashboard_bloc.dart';
import 'package:WashWoosh/bloc/mitra/mitra_detail/mitra_detail_bloc.dart';
import 'package:WashWoosh/bloc/user/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:WashWoosh/bloc/user/laundry/laundry_list_bloc.dart';
import 'package:WashWoosh/bloc/user/laundry_detail/laundry_detail_bloc.dart';
import 'package:WashWoosh/bloc/user/laundry_history/laundry_history_bloc.dart';
import 'package:WashWoosh/bloc/user/laundry_history_detail/laundry_history_detail_bloc.dart';
import 'package:WashWoosh/bloc/user/laundry_jam_operasional/laundry_jam_operasional_bloc.dart';
import 'package:WashWoosh/bloc/user/laundry_jam_operasional/laundry_jam_operasional_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProviders {
  static List<BlocProvider> getProviders() {
    return [
      BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
      BlocProvider<UserRegisterBloc>(create: (context) => UserRegisterBloc()),
      BlocProvider<MitraRegisterBloc>(create: (context) => MitraRegisterBloc()),
      BlocProvider<LaundryListBloc>(create: (context) => LaundryListBloc()),
      BlocProvider<LaundryHistoryBloc>(
          create: (context) => LaundryHistoryBloc()),
      BlocProvider<LaundryHistoryDetailBloc>(
          create: (context) => LaundryHistoryDetailBloc()),
      BlocProvider<LaundryDetailBloc>(create: (context) => LaundryDetailBloc()),
      BlocProvider<MitraDashboardBloc>(
          create: (context) => MitraDashboardBloc()),
      BlocProvider<MitraDetailBloc>(create: (context) => MitraDetailBloc()),
      BlocProvider<MitraActionBloc>(create: (context) => MitraActionBloc()),
      BlocProvider<MitraDetailActionBloc>(create: (context) => MitraDetailActionBloc()),
      BlocProvider<MitraRegisterActionBloc>(create: (context) => MitraRegisterActionBloc()),
      BlocProvider<BottomNavigationBloc>(
          create: (context) => BottomNavigationBloc()),
      BlocProvider<LaundryJamOperasionalBloc>(create: (context) => LaundryJamOperasionalBloc()),
    ];
  }
}
