part of 'mitra_register_bloc.dart';

abstract class MitraRegisterEvent {}
abstract class MitraRegisterActionEvent {}

class MitraRegisterButtonPressed extends MitraRegisterEvent {
  final MitraRegisterRequestModel mitraRegisterRequestModel;

  MitraRegisterButtonPressed({required this.mitraRegisterRequestModel});
}

class MitraPriceExpanded extends MitraRegisterActionEvent {
  final bool isExpanded;

  MitraPriceExpanded({required this.isExpanded});
}

class MitraRegisterReset extends MitraRegisterEvent {}