part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class AddItem extends CartEvent{
  CartProductModel cartProductModel;
  AddItem({required this.cartProductModel});

}
class RemoveItem extends CartEvent{
  CartProductModel cartProductModel;
  RemoveItem({required this.cartProductModel});
}
class IncrementCount extends CartEvent{
  CartProductModel cartProductModel;
  IncrementCount({required this.cartProductModel});
}

class DecrementCount extends CartEvent{
  CartProductModel cartProductModel;
  DecrementCount({required this.cartProductModel});
}

class GetCartItem extends CartEvent{

}