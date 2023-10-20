part of 'laundry_list_bloc.dart';

@immutable
abstract class LaundryListState {}

class LaundryListInitial extends LaundryListState {}

class LaundryListLoading extends LaundryListState {}

class LaundryListSuccess extends LaundryListState {
  final List<Datum> laundryList;

  LaundryListSuccess(this.laundryList);
}

class LaundryListError extends LaundryListState {
  final String errorMessage;

  LaundryListError(this.errorMessage);
}
