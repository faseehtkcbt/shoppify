part of 'obscure_bloc.dart';

@immutable
abstract class ObscureState {}

class ObscureChecked extends ObscureState {
  bool check;
  ObscureChecked(this.check);
}
