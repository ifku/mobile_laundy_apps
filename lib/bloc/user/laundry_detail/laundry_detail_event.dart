part of 'laundry_detail_bloc.dart';

@immutable
abstract class LaundryDetailEvent {}

class LaundryListItemClicked extends LaundryDetailEvent{
  final String token;
  final int laundryId;

  LaundryListItemClicked({required this.token, required this.laundryId});
}


class LaundryJoinButtonClicked extends LaundryDetailEvent{
  final String token;
  final int laundryId;

  LaundryJoinButtonClicked({required this.token, required this.laundryId});
}