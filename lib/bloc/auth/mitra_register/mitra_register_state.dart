part of 'mitra_register_bloc.dart';

@immutable
abstract class MitraRegisterState {}
abstract class MitraRegisterActionState {}
class MitraRegisterInitial extends MitraRegisterState {}

class MitraRegisterLoading extends MitraRegisterState {}
class MitraRegisterSuccess extends MitraRegisterState {}
class MitraRegisterFailure extends MitraRegisterState {
  final String error;

  MitraRegisterFailure({required this.error});
}

class MitraExpandPrice extends MitraRegisterActionState {
  final bool isExpanded;

  MitraExpandPrice(this.isExpanded);
}