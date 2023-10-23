part of 'laundry_detail_bloc.dart';

@immutable
abstract class LaundryDetailState {}

class LaundryDetailInitial extends LaundryDetailState {}

class LaundryDetailLoading extends LaundryDetailState{}
class LaundryDetailSuccess extends LaundryDetailState{
  LaundryDetailData laundryDetailData;

  LaundryDetailSuccess(this.laundryDetailData);
}

class LaundryDetailError extends LaundryDetailState{
  final String errorMessage;

  LaundryDetailError(this.errorMessage);
}

class LaundryDetailJoinLoading extends LaundryDetailState{}

class LaundryDetailJoinSuccess extends LaundryDetailState{
  final String message;

  LaundryDetailJoinSuccess(this.message);
}

class LaundryDetailJoinFailure extends LaundryDetailState{
  final String errorMessage;

    LaundryDetailJoinFailure(this.errorMessage);
}