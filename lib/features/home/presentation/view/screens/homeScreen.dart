import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api/features/home/presentation/bloc/catogories/category_bloc.dart';
import 'package:nasa_api/features/home/presentation/bloc/favorites/favorites_bloc.dart';
import 'package:nasa_api/features/home/presentation/bloc/products_bloc.dart';
import 'package:nasa_api/features/home/presentation/bloc/searchProducts/searched_products_bloc.dart';
import 'package:nasa_api/features/home/presentation/view/widgets/category_list.dart';
import 'package:nasa_api/features/home/presentation/view/widgets/products_grid_view.dart';
import 'package:nasa_api/main.dart';
import 'package:nasa_api/widgets/appTextfield.dart';
import 'package:nasa_api/widgets/apptext.dart';
import 'package:nasa_api/widgets/loading.dart';
import 'package:nasa_api/widgets/space_around_field.dart';

import '../../../data/products/modal/products.dart';

class HomeScreenPage extends StatelessWidget {
  HomeScreenPage({super.key});

  TextEditingController textEditingController = TextEditingController();

  List<String> items = ['All', 'Men', 'Women', 'Kids', 'Gents'];
  @override
  Widget build(BuildContext context) {
    print("favorite data:");
   /* List<Products> data = BlocProvider.of<FavoritesBloc>(context).getDemoData();
    print(data);*/
    context.read<FavoritesBloc>().add(GetFavItem());
    context.read<ProductsBloc>().add(GetProducts());
    context.read<CategoryBloc>().add(GetCategories());
    return Scaffold(
        appBar: AppBar(
          title: AppText(
              text: "Discover",
              fontSize: 30,
              fontWeight: FontWeight.w600,
              textOverFlow: TextOverflow.ellipsis),
          actions: const [

          ],
        ),
        body: BlocConsumer<ProductsBloc, ProductsState>(
          listener: (context, productState) {
            // TODO: implement listener
          },
          builder: (context, productState) {
            if (productState is ProductsLoaded) {
              return SafeArea(
                  child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: BlocConsumer<CategoryBloc, CategoryState>(
                  listener: (context, catogoryState) {
                    // TODO: implement listener
                  },
                  builder: (context, catogoryState) {
                    if (catogoryState is CategoryLoaded) {
                      context.read<SearchedProductsBloc>().add(SearchProducts(
                          products: productState.data,
                          searchText: textEditingController.text,
                          category:
                              catogoryState.data[catogoryState.selectedIndex]));
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SpaceAroundField(),
                            AppTextField(
                              textEditingController: textEditingController,
                              hintText: "Search Anything",
                              textFieldWidth: width * 0.8,
                              onChanged: (value) {
                                context.read<SearchedProductsBloc>().add(
                                    SearchProducts(
                                        products: productState.data,
                                        searchText: textEditingController.text,
                                        category: catogoryState.data[
                                            catogoryState.selectedIndex]));
                              },
                              prefixIcon: Icon(
                                Icons.search_rounded,
                                color: Colors.black,
                              ),
                            ),
                            SpaceAroundField(),
                            CategoryList(
                              items: catogoryState.data,
                              selectedCategory: catogoryState
                                  .data[catogoryState.selectedIndex],
                            ),
                            SpaceAroundField(),
                            BlocConsumer<SearchedProductsBloc,
                                SearchedProductsState>(
                              listener: (context, searchState) {
                                // TODO: implement listener
                              },
                              builder: (context, searchState) {
                                if (searchState is SearchedProductsLoaded) {
                                  return ProductsGridView(
                                    products: searchState.data ?? [],
                                  );
                                } else {
                                  return CustomLoader();
                                }
                              },
                            ),
                            SpaceAroundField()
                          ],
                        ),
                      );
                    } else if (catogoryState is CategoryError) {
                      return Container(
                        child: AppText(
                          text: "Error Occured",
                          fontSize: 25,
                          textColor: Colors.red,
                        ),
                      );
                    } else {
                      return CustomLoader();
                    }
                  },
                ),
              ));
            } else if (productState is ProductsError) {
              return Container(
                child: AppText(
                  text: "Error Occured",
                  fontSize: 25,
                  textColor: Colors.red,
                ),
              );
            } else {
              return CustomLoader();
            }
          },
        ));
  }
}
