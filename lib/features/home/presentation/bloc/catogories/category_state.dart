part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

class CategoryLoaded extends CategoryState {
  List<String> data;
  int selectedIndex;
  CategoryLoaded(this.data, {this.selectedIndex = 0});
}

class CategoryError extends CategoryState {
  ApiException exception;
  CategoryError(this.exception);
}

class CategoryLoading extends CategoryState {}
