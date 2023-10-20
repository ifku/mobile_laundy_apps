import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:mobile_laundy_apps/data/models/auth/login_model.dart';
import 'package:mobile_laundy_apps/const/api_constants.dart';
import 'package:mobile_laundy_apps/data/repositories/local/user_preferences.dart';

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
            Uri.parse(ApiConstants.BASE_URL + ApiConstants.LOGIN),
            body: {
              "username": username,
              "password": password,
            },
          );
          final data = LoginModel.fromJson(json.decode(response.body));
          final token = data.data.apiKey;
          await UserPreferences.saveToken(token);
          switch (data.code) {
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
