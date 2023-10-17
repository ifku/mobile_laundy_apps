import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_laundy_apps/const/Constants.dart';
import 'package:http/http.dart' as http;

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginButtonPressed) {
        emit(LoginLoading());
        final username = event.username;
        final password = event.password;

        try {
          final response = await http.post(
            Uri.parse(Constants.BASE_URL + "login/validasi"),
            body: {
              "username": username,
              "password": password,
            },
          );
          switch (response.statusCode) {
            case 200:
              emit(LoginSuccess());
              break;
            case 400:
              emit(LoginFailure(error: "Username atau password salah"));
              break;
            default:
              emit(LoginFailure(error: "Terjadi kesalahan"));
              break;
          }
        } catch (error) {
          emit(LoginFailure(error: error.toString()));
        }
      }
    });
  }
}
