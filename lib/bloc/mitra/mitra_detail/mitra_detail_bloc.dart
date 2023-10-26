import 'dart:convert';

import 'package:WashWoosh/const/api_constants.dart';
import 'package:WashWoosh/data/models/mitra_laundry_detail_model.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'mitra_detail_event.dart';

part 'mitra_detail_state.dart';

class MitraDetailBloc extends Bloc<MitraDetailEvent, MitraDetailState> {
  MitraDetailBloc() : super(MitraDetailInitial()) {
    on<MitraDetailEvent>((event, emit) async {
      // emit(MitraDetailLoading());
      if (event is OrderListItemClicked) {
        emit(MitraDetailLoading());
        try {
          final response = await http.get(
              Uri.parse(
                  "${ApiConstants.BASE_URL}${ApiConstants.MITRA_GET_ONE_ORDER}${event.laundryId}"),
              headers: {
                "token": event.token,
              });
          final data = MitraLaundryDetail.fromJson(json.decode(response.body));
          switch (data.code) {
            case 200:
              emit(MitraDetailSuccess(data));
              break;
            case 400:
              emit(MitraDetailFailure("Username atau password salah"));
              break;
            default:
              emit(MitraDetailFailure("Terjadi kesalahan"));
              break;
          }
        } catch (error) {
          emit(MitraDetailFailure(error.toString()));
        }
      }
      if (event is OrderStatusChanged) {
        // emit(MitraChangeOrderStatusLoading());
        try {
          final response = await http.post(
              Uri.parse(
                  "${ApiConstants.BASE_URL}${ApiConstants.MITRA_UPDATE_STATUS}${event.laundryId}"),
              headers: {
                "token": event.token,
              },
              body: {
                "status_pemesanan_id": event.status.toString(),
              });
          switch (response.statusCode) {
            case 200:
              emit(MitraChangeOrderStatusSuccess());
              break;
            case 400:
              emit(MitraChangeOrderStatusFailure(
                  "Username atau password salah"));
              break;
            default:
              emit(MitraChangeOrderStatusFailure("Terjadi kesalahan"));
              break;
          }
        } catch (error) {
          emit(MitraChangeOrderStatusFailure(error.toString()));
        }
      }
    });
  }
}
