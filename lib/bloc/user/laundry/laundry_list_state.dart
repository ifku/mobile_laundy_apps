part of 'laundry_list_bloc.dart';

@immutable
abstract class LaundryListState {}

class LaundryListInitial extends LaundryListState {}

class LaundryListLoading extends LaundryListState {}

class LaundryListSuccess extends LaundryListState {
  final List<LaundryData> laundryList;
  final UserData userData;

  LaundryListSuccess(this.laundryList, this.userData);

}

class LaundryListError extends LaundryListState {
  final String errorMessage;

  LaundryListError(this.errorMessage);
}
