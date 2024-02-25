part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class CheckRegister extends RegisterEvent{
  RegisterModal registerModal;
  CheckRegister({required this.registerModal});
}