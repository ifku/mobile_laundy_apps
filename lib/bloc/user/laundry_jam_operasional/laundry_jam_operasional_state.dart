part of 'laundry_jam_operasional_bloc.dart';

@immutable
abstract class LaundryJamOperasionalState {}

class LaundryJamOperasionalInitial extends LaundryJamOperasionalState {}

class LaundryJamOperasionalSuccess extends LaundryJamOperasionalState{
  final JamOperasionalData jamOperasionalData;

  LaundryJamOperasionalSuccess({required this.jamOperasionalData});
}

class LaundryJamOperasionalError extends LaundryJamOperasionalState{
  final String errorMessage;

  LaundryJamOperasionalError({required this.errorMessage});
}