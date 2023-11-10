part of 'laundry_history_bloc.dart';

@immutable
abstract class LaundryHistoryEvent {}

class GetLaundryHistory extends LaundryHistoryEvent{
  final String token;

  GetLaundryHistory({required this.token});
}

class LaundryHistoryReset extends LaundryHistoryEvent{}