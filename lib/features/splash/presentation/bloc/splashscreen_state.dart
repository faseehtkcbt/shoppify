part of 'splashscreen_bloc.dart';

@immutable
abstract class SplashscreenState {}

class ExistingLoading extends SplashscreenState {
   ExistingLoading();
}

class ExistingLoaded extends SplashscreenState {
  bool exist;
  ExistingLoaded(this.exist);
}

class ExistingError extends SplashscreenState {
   ExistingError();
}
