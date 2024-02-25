import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splashscreen_event.dart';
part 'splashscreen_state.dart';

class SplashscreenBloc extends Bloc<SplashscreenEvent, SplashscreenState> {
  SplashscreenBloc() : super(ExistingLoading()) {
    on<SplashScreenLoginCheck>((event, emit) async {
      final pref = await SharedPreferences.getInstance();
      try {
        emit( ExistingLoading());
        if (pref.getBool("login") == true) {
          emit(ExistingLoaded(true));
        } else {
          emit(ExistingLoaded(false));
        }
      } catch (e) {
        throw Exception(e);
      }

      // TODO: implement event handler
    });
  }
}
