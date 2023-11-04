part of 'user_register_bloc.dart';

@immutable
abstract class UserRegisterEvent {}

class UserRegisterButtonPressed extends UserRegisterEvent {
  final UserRegisterRequestModel userRegisterRequestModel;

  UserRegisterButtonPressed({required this.userRegisterRequestModel});
}

class UserRegisterReset extends UserRegisterEvent {}

