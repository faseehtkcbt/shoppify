import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repositories/loginrepositories.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginLoading()) {
    on<CheckLogin>((event, emit)async {
      try {
        emit(LoginLoading());
        final result = await LoginRepositories()
            .loginRepositories(email: event.email, password: event.password);
        var resp;
        result.fold((l) => resp = l, (r) => resp = r);
        if (result.isRight()) {
          emit(LoginLoaded(resp));
        } else {
          emit(LoginError(resp));
        }
      } catch (e) {
        throw Exception(e.toString());
      }
      // TODO: implement event handler
    });
  }
}
