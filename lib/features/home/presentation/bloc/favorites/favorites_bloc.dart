import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nasa_api/features/home/data/products/db/productDb.dart';
import 'package:nasa_api/features/home/data/products/modal/products.dart';

import '../../../../cart/data/model/cart_product_model.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  List<CartProductModel> cartModel = [];
  FavoritesBloc() : super(FavoritesLoaded(favList: [])) {
    on<AddFavItem>((event, emit)async {
      emit(FavoritesInitial());
      event.favList.add(event.newProduct);
      await FavoriteDataBaseHelper.instance.insertProduct(event.newProduct).then((value) => print(value));

      add(GetFavItem());
      // TODO: implement event handler
    });
    on<RemoveFavItem>((event, emit) async{
      emit(FavoritesInitial());
      await FavoriteDataBaseHelper.instance.deleteProduct(event.newProduct.id ?? 0 ).then((value) => print(value));
      // TODO: implement event handler
      add(GetFavItem());

    });
    on<GetFavItem>((event, emit) async {
      emit(FavoritesInitial());
      var response = await FavoriteDataBaseHelper.instance.getProducts();
      emit(FavoritesLoaded(favList: response));
    });
  }
  List<Products> getDemoData() {
    List<Products> currentData = (state as FavoritesLoaded).favList;
    return currentData;
  }
}
