part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}


class CheckLogin extends LoginEvent{
  String email;
  String password;
  CheckLogin({required this.email,required this.password});
}