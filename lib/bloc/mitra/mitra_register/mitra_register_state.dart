part of 'mitra_register_bloc.dart';

@immutable
abstract class MitraRegisterState {}

class MitraRegisterInitial extends MitraRegisterState {}

class MitraRegisterLoading extends MitraRegisterState {}
class MitraRegisterSuccess extends MitraRegisterState {}
class MitraRegisterFailure extends MitraRegisterState {
  final String error;

  MitraRegisterFailure({required this.error});
}