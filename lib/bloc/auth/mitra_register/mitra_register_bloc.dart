import 'package:WashWoosh/const/api_constants.dart';
import 'package:WashWoosh/data/models/auth/mitra_register_request_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'mitra_register_event.dart';

part 'mitra_register_state.dart';

class MitraRegisterBloc extends Bloc<MitraRegisterEvent, MitraRegisterState> {
  MitraRegisterBloc() : super(MitraRegisterInitial()) {
    on<MitraRegisterEvent>((event, emit) async {
      if (event is MitraRegisterButtonPressed) {
        emit(MitraRegisterLoading());
        final mitraRegisterRequestModel = event.mitraRegisterRequestModel;
        try {
          final response = await http.post(
              Uri.parse(ApiConstants.BASE_URL + ApiConstants.REGISTER),
              body: mitraRegisterRequestModel.toJson());
          print(mitraRegisterRequestModel.toJson());
          // print(response.body);
          switch (response.statusCode) {
            case 200:
              emit(MitraRegisterSuccess());
              break;
            default:
              emit(MitraRegisterFailure(error: response.body));
              break;
          }
        } catch (error) {
          emit(MitraRegisterFailure(error: error.toString()));
        }
      }
    });
    on<MitraRegisterReset>((event, emit) {
      emit(MitraRegisterInitial());
    });
  }
}

class MitraRegisterActionBloc
    extends Bloc<MitraRegisterActionEvent, MitraRegisterActionState> {
  MitraRegisterActionBloc() : super(MitraExpandPrice(false)) {
    on<MitraRegisterActionEvent>((event, emit) async {
      if (event is MitraPriceExpanded) {
        emit(MitraExpandPrice(event.isExpanded));
      }
    });
  }
}
