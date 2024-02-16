part of 'splashscreen_bloc.dart';

@immutable
abstract class SplashscreenState {}

class SplashscreenInitial extends SplashscreenState {
  bool login;
  SplashscreenInitial({required this.login});
}
