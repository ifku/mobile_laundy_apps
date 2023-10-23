import 'dart:convert';

import 'package:WashWoosh/const/api_constants.dart';
import 'package:WashWoosh/data/models/user_laundry_model.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'laundry_list_event.dart';
part 'laundry_list_state.dart';

class LaundryListBloc extends Bloc<LaundryListEvent, LaundryListState> {
  LaundryListBloc() : super(LaundryListInitial()) {
    on<LaundryListEvent>((event, emit) async {
      if (event is GetLaundryList) {
        emit(LaundryListLoading());
        try {
          final response = await http.get(
            Uri.parse(ApiConstants.BASE_URL + ApiConstants.LAUNDRY_LIST),
            headers: {
              "token": event.token,
            },
          );

          final data = UserLaundryModel.fromJson(json.decode(response.body));
          switch (data.code) {
            case 200:
              emit(LaundryListSuccess(data.data));
              break;
            case 400:
              emit(LaundryListError("Username atau password salah"));
              break;
            default:
              emit(LaundryListError("Terjadi kesalahan"));
              break;
          }
        } catch (error) {
          print(error);
          emit(LaundryListError(error.toString()));
        }
      }
    });
  }
}
