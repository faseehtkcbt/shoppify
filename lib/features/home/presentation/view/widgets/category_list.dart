import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api/features/home/presentation/bloc/catogories/category_bloc.dart';

import '../../../../../widgets/apptext.dart';
import '../../../../../widgets/decoration.dart';

class CategoryList extends StatelessWidget {
  List<String> items;
  String selectedCategory;
  List<String> sortList = [];
  CategoryList(
      {super.key, required this.items, required this.selectedCategory});
  List<String> getSort(List<String> data) {
    List<String> sortList = [];
    for (int i = 0; i < data.length; i++) {
      String sort = data[(data.length - i - 1)];
      sortList.add(sort);
    }
    return sortList;
  }

  @override
  Widget build(BuildContext context) {
    sortList = getSort(items);
    return SizedBox(
      height: 35,
      child: ListView.builder(
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => context.read<CategoryBloc>().add(
              ChangeIndex(items: items, selectedCategory: sortList[index])),
          child: Container(
            margin: EdgeInsets.all(2),
            padding: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
            height: 20,
            decoration: customDecoration(
                color: index == sortList.indexOf(selectedCategory)
                    ? Colors.black
                    : Colors.grey.shade600,
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: AppText(
                text: sortList[index].toUpperCase(),
                textColor: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ),
        itemCount: items.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
