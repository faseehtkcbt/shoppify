part of 'products_bloc.dart';

@immutable
abstract class ProductsState {}

class ProductsLoaded extends ProductsState {
  List<Products> data;
  ProductsLoaded(this.data);
}

class ProductsError extends ProductsState {
  ApiException exception;
  ProductsError(this.exception);
}

class ProductsLoading extends ProductsState {}
