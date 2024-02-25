part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterLoading extends RegisterState {
   RegisterLoading();
}

class RegisterLoaded extends RegisterState {
  String msg;
  RegisterLoaded(this.msg) {}
}

class RegisterError extends RegisterState {
  String msg;
  RegisterError(this.msg) {
    ;
  }
}
