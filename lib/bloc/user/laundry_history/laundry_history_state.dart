part of 'laundry_history_bloc.dart';

@immutable
abstract class LaundryHistoryState {}

class GetLaundryHistoryInitial extends LaundryHistoryState {}

class GetLaundryHistoryLoading extends LaundryHistoryState {}
class GetLaundryHistorySuccess extends LaundryHistoryState{
  final UserOrderHistory data;

  GetLaundryHistorySuccess(this.data);
}
class GetLaundryHistoryFailure extends LaundryHistoryState{
  final String message;

  GetLaundryHistoryFailure(this.message);
}