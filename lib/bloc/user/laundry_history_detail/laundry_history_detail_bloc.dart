import 'dart:convert';

import 'package:WashWoosh/const/api_constants.dart';
import 'package:WashWoosh/data/models/user/user_order_detail_model.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'laundry_history_detail_event.dart';
part 'laundry_history_detail_state.dart';

class LaundryHistoryDetailBloc
    extends Bloc<LaundryHistoryDetailEvent, LaundryHistoryDetailState> {
  LaundryHistoryDetailBloc() : super(LaundryHistoryDetailInitial()) {
    on<OrderListItemClicked>((event, emit) async {
      print("Clicked");
      emit(LaundryHistoryDetailLoading());
      try {
        final response = await http.get(
          Uri.parse(ApiConstants.BASE_URL +
              ApiConstants.USER_GET_ONE_ORDER +
              event.laundryId.toString()),
          headers: {
            "token": event.token,
          },
        );
        final data = UserOrderHistoryDetail.fromJson(json.decode(response.body));
        switch (data.code) {
          case 200:
            emit(LaundryHistoryDetailSuccess(data));
            break;
          default:
            emit(LaundryHistoryDetailFailure("Terjadi kesalahan"));
            break;
        }
      } catch (error) {
        emit(LaundryHistoryDetailFailure(error.toString()));
      }
    });
    on<ResetLaundryHistoryDetailEvent>((event, emit) {
      emit(LaundryHistoryDetailInitial());
    });
  }
}
