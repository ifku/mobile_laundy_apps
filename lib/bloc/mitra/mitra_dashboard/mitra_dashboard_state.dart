part of 'mitra_dashboard_bloc.dart';

@immutable
abstract class MitraDashboardState {}

/*Get data state*/
class MitraDashboardInitial extends MitraDashboardState {}

class MitraDashboardLoading extends MitraDashboardState {}

class MitraDashboardSuccess extends MitraDashboardState {
  final List<MitraOrderData> orderList;

  MitraDashboardSuccess(this.orderList);
}

class MitraDashboardFailure extends MitraDashboardState {
  final String errorMessage;

  MitraDashboardFailure({required this.errorMessage});
}

/*Add Order State*/
class AddOrderLoading extends MitraDashboardState {}

class AddOrderSuccess extends MitraDashboardState {}

class AddOrderFailure extends MitraDashboardState {
  final String errorMessage;

  AddOrderFailure({required this.errorMessage});
}

/*Fetch member state*/
class MitraDashboardFetchMember extends MitraDashboardState {
  final MitraLaundryMembership users;

  MitraDashboardFetchMember({required this.users});
}
