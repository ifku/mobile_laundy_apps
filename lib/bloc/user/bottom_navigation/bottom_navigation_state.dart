part of 'bottom_navigation_bloc.dart';

@immutable
abstract class BottomNavigationState {}

class BottomNavigationInitial extends BottomNavigationState {
  final int index;

  BottomNavigationInitial(this.index);
}
