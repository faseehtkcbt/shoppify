import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api/features/home/presentation/view/widgets/product_card.dart';
import 'package:nasa_api/routes.dart';
import 'package:nasa_api/widgets/apptext.dart';
import 'package:nasa_api/widgets/loading.dart';

import '../../../data/products/modal/products.dart';
import '../../bloc/favorites/favorites_bloc.dart';

class ProductsGridView extends StatelessWidget {
  List<Products> products;


  ProductsGridView({super.key,  required this.products,});

  @override
  Widget build(BuildContext context) {
    return products.isNotEmpty
        ? GridView.builder(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          crossAxisCount: 2,
          childAspectRatio: 0.75),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () =>
              Navigator.pushNamed(
                  context, Routes.productDetailScreen,
                  arguments: products[index]),
          child: BlocConsumer<FavoritesBloc, FavoritesState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if(state is FavoritesLoaded)
              return ProductCard(
                favList: state.favList,
                product: products[index],
              );
              else
                return CustomLoader();
            },
          ),
        );
      },
      itemCount: products.length,
      shrinkWrap: true,
    )
        : Center(
      child: AppText(text: "No Data"),
    );
  }
}
