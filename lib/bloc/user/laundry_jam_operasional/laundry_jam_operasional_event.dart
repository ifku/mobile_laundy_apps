part of 'laundry_jam_operasional_bloc.dart';

@immutable
abstract class LaundryJamOperasionalEvent {}

class LaundryGetJamOperasional extends LaundryJamOperasionalEvent{
  final String token;
  final int laundryId;

  LaundryGetJamOperasional({required this.token, required this.laundryId});
}