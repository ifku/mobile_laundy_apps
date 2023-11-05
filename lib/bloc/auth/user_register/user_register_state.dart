part of '../../auth/user_register/user_register_bloc.dart';

@immutable
abstract class UserRegisterState {}

class UserRegisterInitial extends UserRegisterState {}

class UserRegisterLoading extends UserRegisterState{}
class UserRegisterSuccess extends UserRegisterState{}
class UserRegisterFailure extends UserRegisterState{
  final String error;

  UserRegisterFailure({required this.error});
}