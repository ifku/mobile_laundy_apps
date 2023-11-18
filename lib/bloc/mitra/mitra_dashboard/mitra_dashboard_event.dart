part of 'mitra_dashboard_bloc.dart';

@immutable
abstract class MitraDashboardEvent {}
abstract class MitraActionEvent {}

class AddOrderClicked extends MitraDashboardEvent {
  final String token;
  final MitraMembershipRequestModel? mitraMembershipRequestModel;

  AddOrderClicked({
    required this.token,
    required this.mitraMembershipRequestModel
  });
}

class GetOrderList extends MitraDashboardEvent {
  final String token;

  GetOrderList({required this.token});
}

class GetMitraMember extends MitraDashboardEvent {
  final String token;

  GetMitraMember({required this.token});
}

class ToggleSwitchClicked extends MitraActionEvent {
  final bool isSwitchOn;

  ToggleSwitchClicked({required this.isSwitchOn});
}
class MitraOrderListReset extends MitraDashboardEvent {}
