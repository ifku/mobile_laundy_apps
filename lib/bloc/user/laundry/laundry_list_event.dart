part of 'laundry_list_bloc.dart';

@immutable
abstract class LaundryListEvent {}

class GetLaundryList extends LaundryListEvent {
  final String token;

  GetLaundryList({required this.token});
}