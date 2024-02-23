import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../constants/app_constants.dart';
import '../../../data/category/repositories/category_repositories.dart';
import '../../../data/products/modal/products.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryLoading()) {
    on<GetCategories>((event, emit) async {
      emit(CategoryLoading());
      final response = await CategoryRepositories().getCategoryRepositories();
      var resp;
      response.fold((l) => resp = l, (r) => resp = r);
      if (response.isRight()) {
        resp.add('all');
        emit(CategoryLoaded(resp, selectedIndex: resp.length - 1));
      } else {
        emit(CategoryError(resp));
      }
    });
    on<ChangeIndex>((event, emit) {
      emit(CategoryLoading());
      emit(CategoryLoaded(event.items,
          selectedIndex: event.items.indexOf(event.selectedCategory)));
    });
  }
}
