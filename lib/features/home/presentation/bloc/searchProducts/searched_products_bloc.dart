import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../constants/app_constants.dart';
import '../../../data/products/modal/products.dart';

part 'searched_products_event.dart';
part 'searched_products_state.dart';

class SearchedProductsBloc
    extends Bloc<SearchedProductsEvent, SearchedProductsState> {
  SearchedProductsBloc() : super(SearchedProductsLoading()) {
    on<SearchProducts>((event, emit) {
      emit(SearchedProductsLoading());
      List<Products> searchedProducts = [];

      if (event.category == 'all') {
        event.products.forEach((element) {
          if (element.title!.toLowerCase().contains(event.searchText)) {
            searchedProducts.add(element);
          }
        });
      } else {
        event.products.forEach((element) {
          if (element.category == event.category &&
              element.title!.toLowerCase().contains(event.searchText)) {
            searchedProducts.add(element);
          }
        });
      }

      emit(SearchedProductsLoaded(searchedProducts));

      // TODO: implement event handler
    });
  }
}
