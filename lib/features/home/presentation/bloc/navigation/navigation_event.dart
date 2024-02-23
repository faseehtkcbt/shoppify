part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent {}

class ChangeBar extends NavigationEvent{
  int currentIndex;
  ChangeBar({required this.currentIndex});
}