import 'dart:async';
import 'dart:convert';

import 'package:WashWoosh/const/api_constants.dart';
import 'package:WashWoosh/data/models/user_order_history_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'laundry_history_event.dart';

part 'laundry_history_state.dart';

class LaundryHistoryBloc
    extends Bloc<LaundryHistoryEvent, LaundryHistoryState> {
  LaundryHistoryBloc() : super(GetLaundryHistoryInitial()) {
    emit(GetLaundryHistoryInitial());
    on<GetLaundryHistory>((event, emit) async {
      emit(GetLaundryHistoryLoading());
      try {
        final response = await http.get(
            Uri.parse(ApiConstants.BASE_URL + ApiConstants.LAUNDRY_ORDER),
            headers: {
              "token": event.token,
            });
        final data = UserOrderHistory.fromJson(json.decode(response.body));
        print(data.data);
        switch (data.code) {
          case 200:
            emit(GetLaundryHistorySuccess(data));
            break;
          default:
            emit(GetLaundryHistoryFailure("Terjadi kesalahan"));
            break;
        }
      } catch (error) {
        emit(GetLaundryHistoryFailure(error.toString()));
      }
    });
    on<LaundryHistoryReset>((event, emit) async {
      emit(GetLaundryHistoryInitial());
    });
  }
}
