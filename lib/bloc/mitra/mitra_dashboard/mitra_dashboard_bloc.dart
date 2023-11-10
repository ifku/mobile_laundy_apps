import 'dart:convert';

import 'package:WashWoosh/const/api_constants.dart';
import 'package:WashWoosh/data/models/mitra_laundry_membership_model.dart';
import 'package:WashWoosh/data/models/mitra_membership_request_model.dart';
import 'package:WashWoosh/data/models/mitra_membership_response_model.dart';
import 'package:WashWoosh/data/models/mitra_order_model.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'mitra_dashboard_event.dart';

part 'mitra_dashboard_state.dart';

class MitraDashboardBloc
    extends Bloc<MitraDashboardEvent, MitraDashboardState> {
  MitraDashboardBloc() : super(MitraDashboardInitial()) {
    on<MitraDashboardEvent>((event, emit) async {
      if (event is GetOrderList) {
        emit((MitraDashboardLoading()));
        try {
          final response = await http.get(
            Uri.parse(ApiConstants.BASE_URL + ApiConstants.MITRA_ORDER),
            headers: {
              "token": event.token,
            },
          );

          final data = MitraOrder.fromJson(json.decode(response.body));
          switch (data.code) {
            case 200:
              emit(MitraDashboardSuccess(data.data));
              break;
            case 400:
              emit(MitraDashboardFailure(
                  errorMessage: "Username atau password salah"));
              break;
            default:
              emit(MitraDashboardFailure(errorMessage: "Terjadi kesalahan"));
              break;
          }
        } catch (error) {
          emit(MitraDashboardFailure(errorMessage: error.toString()));
        }
      }
      if (event is GetMitraMember) {
        try {
          final response = await http.get(
            Uri.parse(ApiConstants.BASE_URL + ApiConstants.MITRA_MEMBER),
            headers: {
              "token": event.token,
            },
          );
          final data =
              MitraLaundryMembership.fromJson(json.decode(response.body));
          switch (data.code) {
            case 200:
              emit(MitraDashboardFetchMember(users: data));
              break;
          }
        } catch (error) {
          emit(MitraDashboardFailure(errorMessage: error.toString()));
        }
      }
      if (event is AddOrderClicked) {
        try {
          emit(AddOrderLoading());
          final data = MitraMembershipRequestModel(
              harga: event.mitraMembershipRequestModel!.harga,
              estimasiTanggalSelesai:
                  event.mitraMembershipRequestModel!.estimasiTanggalSelesai,
              customerId: event.mitraMembershipRequestModel!.customerId,
              statusPemesananId:
                  event.mitraMembershipRequestModel!.statusPemesananId);
          final response = await http.post(
              Uri.parse(ApiConstants.BASE_URL + ApiConstants.MITRA_ORDER),
              headers: {
                "token": event.token,
              },
              body: data.toJson());
          switch (response.statusCode) {
            case 200:
              emit(AddOrderSuccess());
              break;
            case 400:
              emit(AddOrderFailure(errorMessage: "Terjadi kesalahan"));
              break;
          }
          print(response.body);
        } catch (error) {
          emit(AddOrderFailure(errorMessage: error.toString()));
        }
      }
    });
    on<MitraOrderListReset>((event, emit) async {
      emit(MitraDashboardInitial());
    });
  }
}
