part of 'mitra_detail_bloc.dart';

@immutable
abstract class MitraDetailState {}

class MitraDetailInitial extends MitraDetailState {}

class MitraDetailSuccess extends MitraDetailState{
  final MitraLaundryDetail mitraDetailData;

  MitraDetailSuccess(this.mitraDetailData);
}
class MitraDetailLoading extends MitraDetailState{}
class MitraDetailFailure extends MitraDetailState{
  final String errorMessage;

  MitraDetailFailure(this.errorMessage);
}

class MitraChangeOrderStatusSuccess extends MitraDetailState{}
class MitraChangeOrderStatusLoading extends MitraDetailState{}
class MitraChangeOrderStatusFailure extends MitraDetailState{
  final String errorMessage;

  MitraChangeOrderStatusFailure(this.errorMessage);
}