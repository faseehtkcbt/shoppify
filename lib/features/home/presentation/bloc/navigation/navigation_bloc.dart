import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitial(currentIndex: 0)) {
    on<ChangeBar>((event, emit) {
      emit(NavigationInitial(currentIndex: event.currentIndex));
      // TODO: implement event handler
    });
  }
}
