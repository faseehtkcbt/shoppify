part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {}

class GetCategories extends CategoryEvent {}

class ChangeIndex extends CategoryEvent {
  List<String> items;
  String selectedCategory;
  ChangeIndex({required this.items, required this.selectedCategory});
}
