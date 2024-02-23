import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nasa_api/features/home/data/products/modal/products.dart';

import '../../../data/cart/model/cart_product_model.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  List<CartProductModel> cartModel = [];
  FavoritesBloc() : super(FavoritesLoaded(favList: [])) {
    on<AddFavItem>((event, emit) {
      emit(FavoritesInitial());
      event.favList.add(event.newProduct);
      emit(FavoritesLoaded(favList: event.favList));
      // TODO: implement event handler
    });
    on<RemoveFavItem>((event, emit) {
      List<Products> newFavList = [];
      emit(FavoritesInitial());
      event.favList.forEach((element) {
        if (element.id != event.newProduct.id) {
          newFavList.add(element);
        }
      });
      emit(FavoritesLoaded(favList: newFavList));
      // TODO: implement event handler
    });
  }
  List<Products> getData() {
    List<Products> currentData = (state as FavoritesLoaded).favList;
    return currentData;
  }
}
