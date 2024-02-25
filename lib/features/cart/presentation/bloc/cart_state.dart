part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartLoaded extends CartState{
  List<Products> cartList;
  CartLoaded({required this.cartList});
}

class CartError extends CartState {
  ApiException exception;
  CartError(this.exception);
}
