part of 'laundry_history_detail_bloc.dart';

@immutable
abstract class LaundryHistoryDetailState {}

class LaundryHistoryDetailInitial extends LaundryHistoryDetailState {}
class LaundryHistoryDetailSuccess extends LaundryHistoryDetailState{
  final UserOrderHistoryDetail laundryDetailData;

  LaundryHistoryDetailSuccess(this.laundryDetailData);
}
class LaundryHistoryDetailLoading extends LaundryHistoryDetailState{}
class LaundryHistoryDetailFailure extends LaundryHistoryDetailState{
  final String errorMessage;

  LaundryHistoryDetailFailure(this.errorMessage);
}