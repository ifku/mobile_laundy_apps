part of 'bottom_navigation_bloc.dart';

@immutable
abstract class BottomNavigationEvent {}

class BottomNavigationItemClicked extends BottomNavigationEvent {
  final int index;

  BottomNavigationItemClicked({required this.index});
}