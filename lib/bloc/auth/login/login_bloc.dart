import 'dart:convert';

import 'package:WashWoosh/const/api_constants.dart';
import 'package:WashWoosh/data/models/auth/login_model.dart';
import 'package:WashWoosh/data/repositories/local/user_preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(LoginInitial());
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
          final is_mitra = data.data.isMitra;
          await UserPreferences.saveToken(token, is_mitra);
          await UserPreferences.saveUserData(data.data.user);
          switch (data.code) {
            case 200:
              if (data.data.isMitra) {
                emit((LoginIsMitra()));
              } else {
                emit(LoginSuccess());
              }
              break;
            default:
              emit(LoginFailure(error: "Username atau password salah"));
              break;
          }
        } catch (error) {
          print(error.toString());
          emit(LoginFailure(error: "Terjadi kesalahan saat login"));
        }
      }
      if (event is LogoutButtonPressed) {
        await UserPreferences.removeToken();
        await UserPreferences.removeUserData();
        emit(LogoutSuccess());
        emit(LoginInitial());
      }
    });
  }
}
