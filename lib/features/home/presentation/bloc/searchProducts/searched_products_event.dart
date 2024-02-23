part of 'searched_products_bloc.dart';

@immutable
abstract class SearchedProductsEvent {}

class SearchProducts extends SearchedProductsEvent{
  List<Products> products;
  String searchText;
  String category;
  SearchProducts({required this.products,required this.searchText,required this.category});
}