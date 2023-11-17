import 'dart:convert';

import 'package:WashWoosh/const/api_constants.dart';
import 'package:WashWoosh/data/models/user/user_laundry_detail_model.dart';
import 'package:WashWoosh/data/models/user/user_laundry_join_membership_model.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'laundry_detail_event.dart';
part 'laundry_detail_state.dart';

class LaundryDetailBloc extends Bloc<LaundryDetailEvent, LaundryDetailState> {
  LaundryDetailBloc() : super(LaundryDetailInitial()) {
    on<LaundryDetailEvent>((event, emit) async {
      if (event is LaundryListItemClicked) {
        emit(LaundryDetailLoading());
        final laundryId = event.laundryId;
        try {
          final response = await http.get(
              Uri.parse(
                  "${ApiConstants.BASE_URL}${ApiConstants.LAUNDRY_LIST}/$laundryId"),
              headers: {
                "token": event.token,
              });
          final data =
              UserLaundryDetailModel.fromJson(json.decode(response.body));
          switch (response.statusCode) {
            case 200:
              emit(LaundryDetailSuccess(data.data));
              break;
            case 400:
              emit(LaundryDetailError("Username atau password salah"));
              break;
            default:
              emit(LaundryDetailError("Terjadi kesalahan"));
              break;
          }
        } catch (error) {
          emit(LaundryDetailError(error.toString()));
        }
      }

      if (event is LaundryJoinButtonClicked) {
        emit(LaundryDetailJoinLoading());
        final laundryId = event.laundryId;
        try {
          final response = await http.post(
              Uri.parse(
                  "${ApiConstants.BASE_URL}${ApiConstants.LAUNDRY_JOIN}$laundryId"),
              headers: {
                "token": event.token,
              });
          final data =
              UserLaundryJoinMembership.fromJson(json.decode(response.body));
          switch (data.code) {
            case 200:
              emit(LaundryDetailJoinSuccess(data.message));
              break;
            case 400:
              emit(LaundryDetailJoinFailure(data.message));
              break;
            default:
              emit(LaundryDetailJoinFailure("Terjadi kesalahan"));
              break;
          }
        } catch (error) {
          emit(LaundryDetailJoinFailure(error.toString()));
        }
      }
    });
  }
}
