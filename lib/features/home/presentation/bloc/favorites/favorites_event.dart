part of 'favorites_bloc.dart';

@immutable
abstract class FavoritesEvent {}

class AddFavItem extends FavoritesEvent {
  List<Products> favList;
  Products newProduct;
  AddFavItem({required this.favList, required this.newProduct});
}

class RemoveFavItem extends FavoritesEvent {
  List<Products> favList;
  Products newProduct;
  RemoveFavItem({required this.favList, required this.newProduct});
}

class CheckFavItem extends FavoritesEvent {}
