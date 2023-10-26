part of 'mitra_detail_bloc.dart';

@immutable
abstract class MitraDetailEvent {}

class OrderListItemClicked extends MitraDetailEvent{
  final String token;
  final int laundryId;

  OrderListItemClicked({required this.token, required this.laundryId});
}

class OrderStatusChanged extends MitraDetailEvent{
  final String token;
  final int laundryId;
  final int status;

  OrderStatusChanged({required this.token, required this.laundryId, required this.status});
}
