part of 'mitra_detail_bloc.dart';

@immutable
abstract class MitraDetailEvent {}

abstract class MitraDetailActionEvent {}

class OrderListItemClicked extends MitraDetailEvent {
  final String token;
  final int laundryId;

  OrderListItemClicked({required this.token, required this.laundryId});
}

class OrderStatusChanged extends MitraDetailEvent {
  final String token;
  final int laundryId;
  final int status;
  final bool isDibayar;

  // final MitraUpdateStatus mitraUpdateStatus;

  OrderStatusChanged(
      {required this.token,
      required this.laundryId,
      required this.status,
      required this.isDibayar});
}

class DetailToggleSwitchClicked extends MitraDetailActionEvent {
  final bool isSwitchOn;

  DetailToggleSwitchClicked({required this.isSwitchOn});
}

class ResetMitraDetailState extends MitraDetailEvent {}
