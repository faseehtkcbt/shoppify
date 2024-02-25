import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'obscure_event.dart';
part 'obscure_state.dart';

class ObscureBloc extends Bloc<ObscureEvent, ObscureState> {
  ObscureBloc() : super(ObscureChecked( true)) {
    on<ObscureCheck>((event, emit) {
      if(event.check == true){
        emit(ObscureChecked(false));
      }
      else{
        emit(ObscureChecked(true));
      }
      // TODO: implement event handler
    });
  }
}