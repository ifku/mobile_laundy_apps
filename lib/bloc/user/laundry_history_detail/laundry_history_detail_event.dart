part of 'laundry_history_detail_bloc.dart';

@immutable
abstract class LaundryHistoryDetailEvent {}
class OrderListItemClicked extends LaundryHistoryDetailEvent{
  final String token;
  final int laundryId;

  OrderListItemClicked({required this.token, required this.laundryId});
}

class ResetLaundryHistoryDetailEvent extends LaundryHistoryDetailEvent {}