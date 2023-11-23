import 'dart:async';
import 'dart:convert';

import 'package:WashWoosh/const/api_constants.dart';
import 'package:WashWoosh/data/models/user/user_laundry_jam_operasional_model.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'laundry_jam_operasional_event.dart';
part 'laundry_jam_operasional_state.dart';

class LaundryJamOperasionalBloc extends Bloc<LaundryJamOperasionalEvent, LaundryJamOperasionalState> {
  LaundryJamOperasionalBloc() : super(LaundryJamOperasionalInitial()) {
    on<LaundryGetJamOperasional>((event, emit) async {
      final laundryId = event.laundryId;
      try {
        final response = await http.get(
            Uri.parse(
                "${ApiConstants.BASE_URL}${ApiConstants.LAUNDRY_JAM_OPERASIONAL}$laundryId"),
            headers: {
              "token": event.token,
            });
        final data =
        UserLaundryJamOperasional.fromJson(json.decode(response.body));
        switch (response.statusCode) {
          case 200:
            emit(LaundryJamOperasionalSuccess(jamOperasionalData: data.data));
            break;
          default:
            emit(LaundryJamOperasionalError(errorMessage: "Data tidak ditemukan!"));
            break;
        }
      } catch (error) {
        emit(LaundryJamOperasionalError(errorMessage: error.toString()));
      }
    });
  }
}
