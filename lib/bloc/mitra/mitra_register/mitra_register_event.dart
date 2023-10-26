part of 'mitra_register_bloc.dart';

abstract class MitraRegisterEvent {}

class MitraRegisterButtonPressed extends MitraRegisterEvent {
  List<MitraRegisterRequestModel> mitraRegisterRequestModel;

  MitraRegisterButtonPressed({required this.mitraRegisterRequestModel});
}