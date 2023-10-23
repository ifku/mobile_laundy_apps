part of 'mitra_register_bloc.dart';

@immutable
abstract class MitraRegisterEvent {}

class MitraRegisterButtonPressed extends MitraRegisterEvent {
  List<MitraRegisterRequestModel> mitraRegisterRequestModel;

  MitraRegisterButtonPressed({required this.mitraRegisterRequestModel});
}