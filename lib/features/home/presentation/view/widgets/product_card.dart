import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api/constants/app_constants.dart';
import 'package:nasa_api/features/home/presentation/bloc/favorites/favorites_bloc.dart';
import 'package:nasa_api/features/home/presentation/view/widgets/star_icon.dart';
import 'package:nasa_api/features/product_detail/presentation/view/widget/favorite_button.dart';
import 'package:nasa_api/widgets/customImage.dart';
import 'package:nasa_api/widgets/loading.dart';

import '../../../../../main.dart';
import '../../../../../widgets/apptext.dart';
import '../../../../../widgets/decoration.dart';
import '../../../data/products/modal/products.dart';

class ProductCard extends StatelessWidget {
  Products product;

  ProductCard({super.key, required this.product,required this.favList});

  List<Products> favList ;

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<FavoritesBloc, FavoritesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(5),
          height: 250,
          width: width * 0.4,
          decoration: customDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxBorder: Border.all(color: Colors.black, width: 2)),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomImage(
                      imageSrc: product.image ?? "",
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      boxFit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    height: 90,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StarIcon(rating: product.rating),
                        AppText(
                          text: product.title ?? "",
                          maxLines: 2,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                        AppText(
                          text: "${AppConstants.rupeeSymbol} " +
                              product.price.toString(),
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  child: BlocConsumer<FavoritesBloc, FavoritesState>(
                    listener: (context, favState) {
                      // TODO: implement listener
                    },
                    builder: (context, favState) {
                      if (favState is FavoritesLoaded) {
                        return FavoriteButton(
                          favList: favList,
                          product: product,
                        );
                      } else {
                        return CustomLoader(
                          size: 5,
                        );
                      }
                    },
                  ))
            ],
          ),
        );
      },
    );
  }
}
