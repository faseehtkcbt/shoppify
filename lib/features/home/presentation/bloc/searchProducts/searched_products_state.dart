part of 'searched_products_bloc.dart';

@immutable
abstract class SearchedProductsState {}

class SearchedProductsLoaded extends SearchedProductsState {
  List<Products> data;
  SearchedProductsLoaded(this.data);
}

class SearchedProductsLoading extends SearchedProductsState {}
