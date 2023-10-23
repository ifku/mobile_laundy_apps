import 'package:WashWoosh/const/api_constants.dart';
import 'package:WashWoosh/data/models/auth/mitra_register_request_model.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'mitra_register_event.dart';
part 'mitra_register_state.dart';

class MitraRegisterBloc extends Bloc<MitraRegisterEvent, MitraRegisterState> {
  MitraRegisterBloc() : super(MitraRegisterInitial()) {
    on<MitraRegisterEvent>((event, emit) async {
      if (event is MitraRegisterButtonPressed) {
        emit(MitraRegisterLoading());
        final mitraRegisterRequestModel = event.mitraRegisterRequestModel;
        // final mitraRegisterRequestModelJson = mitraRegisterRequestModel
        // try {
        //   final response = await http.post(Uri.parse(ApiConstants.BASE_URL + ApiConstants.MITRA_REGISTER),
        //       body:
        // } catch (error) {
        //
        // }
        }
    });
  }
}
