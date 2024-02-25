part of 'login_bloc.dart';

@immutable
abstract class LoginState {}


class LoginLoading extends LoginState {
   LoginLoading();
}

class LoginLoaded extends LoginState {
  String msg;
  LoginLoaded(this.msg);
}

class LoginError extends LoginState {
  String msg;
  LoginError(this.msg);
}