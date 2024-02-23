part of 'navigation_bloc.dart';

@immutable
abstract class NavigationState {}

class NavigationInitial extends NavigationState {
  int currentIndex;
  NavigationInitial({required this.currentIndex});
}
