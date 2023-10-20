import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_register_event.dart';
part 'user_register_state.dart';

class UserRegisterBloc extends Bloc<UserRegisterEvent, UserRegisterState> {
  UserRegisterBloc() : super(UserRegisterInitial()) {
    on<UserRegisterEvent>((event, emit) {

    });
  }
}
