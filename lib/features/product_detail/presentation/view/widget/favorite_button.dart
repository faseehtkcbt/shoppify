import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api/features/home/presentation/bloc/favorites/favorites_bloc.dart';
import 'package:nasa_api/widgets/loading.dart';

import '../../../../../methods/common_methods.dart';
import '../../../../../widgets/decoration.dart';
import '../../../../home/data/products/modal/products.dart';

class FavoriteButton extends StatelessWidget {
  Products product;
  List<Products> favList = [];

  FavoriteButton({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    favList = BlocProvider.of<FavoritesBloc>(context).getData();
    return GestureDetector(
      onTap: CommonMethods().checkFavorite(favList, product)
          ? () {
              context
                  .read<FavoritesBloc>()
                  .add(RemoveFavItem(favList: favList, newProduct: product));
            }
          : () {
              context
                  .read<FavoritesBloc>()
                  .add(AddFavItem(favList: favList, newProduct: product));
            },
      child: Container(
        height: 40,
        width: 40,
        decoration: customDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade200),
        child: CommonMethods().checkFavorite(favList, product)
            ? Icon(
                Icons.favorite,
                size: 25,
                color: Colors.redAccent,
              )
            : Icon(
                Icons.favorite_border_outlined,
                size: 25,
                color: Colors.black,
              ),
      ),
    );
  }
}
