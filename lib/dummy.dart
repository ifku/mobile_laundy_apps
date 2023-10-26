import 'package:WashWoosh/bloc/user/laundry/laundry_list_bloc.dart';
import 'package:WashWoosh/data/repositories/local/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dummy extends StatefulWidget {
  const Dummy({super.key});

  @override
  State<Dummy> createState() => _DummyState();
}

class _DummyState extends State<Dummy> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initializeData();
    });
  }

  Future<void> initializeData() async {
    final laundryListBloc = BlocProvider.of<LaundryListBloc>(context);
    final token = await UserPreferences.getToken();
    if (token != null) {
      laundryListBloc.add(GetLaundryList(token: token['token']));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
