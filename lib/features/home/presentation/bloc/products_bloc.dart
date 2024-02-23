import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nasa_api/constants/app_constants.dart';
import 'package:nasa_api/features/home/data/category/repositories/category_repositories.dart';

import '../../data/products/modal/products.dart';
import '../../data/products/repositories/products_repositories.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsLoading()) {
    on<GetProducts>((event, emit) async {
      emit(ProductsLoading());
      final response = await ProductsRepositories().getProductsRepositories();
      var resp;
      response.fold((l) => resp = l, (r) => resp = r);
      if (response.isRight()) {
        emit(ProductsLoaded(resp));
      } else {
        emit(ProductsError(resp));
      }
      // TODO: implement event handler
    });
  }
}
