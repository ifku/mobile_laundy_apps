import 'package:WashWoosh/bloc/auth/user_register/user_register_bloc.dart';
import 'package:WashWoosh/const/api_constants.dart';
import 'package:WashWoosh/data/models/auth/user_register_response_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:http/http.dart' as http;

part 'user_register_event.dart';

part 'user_register_state.dart';

class UserRegisterBloc extends Bloc<UserRegisterEvent, UserRegisterState> {
  UserRegisterBloc() : super(UserRegisterInitial()) {
    emit(UserRegisterInitial());
    on<UserRegisterButtonPressed>((event, emit) async {
      emit(UserRegisterLoading());
      try {
        final userRegisterRequestModel = event.userRegisterRequestModel;
        final response = await http.post(
          Uri.parse(ApiConstants.BASE_URL + ApiConstants.REGISTER),
          body: userRegisterRequestModel.toJson(),
        );
        switch (response.statusCode) {
          case 200:
            emit(UserRegisterSuccess());
            break;
          default:
            emit(UserRegisterFailure(
                error: "Terdapat kesalahan ketika mendaftarkan akun anda!"));
            break;
        }
      } catch (error) {
        print(error.toString());
        emit(UserRegisterFailure(
            error: "Terdapat kesalahan ketika mendaftarkan akun anda!"));
      }
    });
    on<UserRegisterReset>((event, emit) async {
      emit(UserRegisterInitial());
    });
  }
}
