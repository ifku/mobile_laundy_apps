import 'dart:convert';

import 'package:WashWoosh/const/api_constants.dart';
import 'package:WashWoosh/data/models/auth/login_model.dart';
import 'package:WashWoosh/data/models/user/user_laundry_model.dart';
import 'package:WashWoosh/data/repositories/local/user_preferences.dart';
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
          final userData = await UserPreferences.getUserData();
          final data = UserLaundryModel.fromJson(json.decode(response.body));
          switch (data.code) {
            case 200:
              emit(LaundryListSuccess(data.data, userData!));
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
    on<SearchLaundry>((event, emit) {
      if (event.keyword.isEmpty) {
        emit(LaundryListInitial());
      } else {
        final filteredLaundryList = (state as LaundryListSuccess)
            .laundryList
            .where((element) => element.nama
                .toLowerCase()
                .contains(event.keyword.toLowerCase()))
            .toList();
        emit(LaundryListFiltered(filteredLaundryList));
      }
    });
  }
}
