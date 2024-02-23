import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splashscreen_event.dart';
part 'splashscreen_state.dart';

class SplashscreenBloc extends Bloc<SplashscreenEvent, SplashscreenState> {
  SplashscreenBloc() : super(SplashscreenInitial(login: false)) {
    on<SplashScreenLoginCheck>((event, emit) async {
      await Future.delayed(const Duration(seconds: 3), () {
        emit(SplashscreenInitial(login: true));
      });

      // TODO: implement event handler
    });
  }
}
