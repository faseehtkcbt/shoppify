part of 'obscure_bloc.dart';

@immutable
abstract class ObscureEvent {}

class ObscureCheck extends ObscureEvent{
  bool check;
  ObscureCheck({ required this.check});
}