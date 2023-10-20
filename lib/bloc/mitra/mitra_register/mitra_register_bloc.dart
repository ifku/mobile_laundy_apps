import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mitra_register_event.dart';
part 'mitra_register_state.dart';

class MitraRegisterBloc extends Bloc<MitraRegisterEvent, MitraRegisterState> {
  MitraRegisterBloc() : super(MitraRegisterInitial()) {
    on<MitraRegisterEvent>((event, emit) {

    });
  }
}
