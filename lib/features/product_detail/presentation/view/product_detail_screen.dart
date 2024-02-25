import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api/constants/app_constants.dart';
import 'package:nasa_api/features/cart/data/model/cart_product_model.dart';
import 'package:nasa_api/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:nasa_api/features/home/presentation/bloc/favorites/favorites_bloc.dart';
import 'package:nasa_api/features/home/presentation/view/widgets/star_icon.dart';
import 'package:nasa_api/features/product_detail/presentation/view/widget/favorite_button.dart';
import 'package:nasa_api/widgets/app_icon_text_button.dart';
import 'package:nasa_api/widgets/common_bottom_bar.dart';
import 'package:nasa_api/widgets/customImage.dart';
import 'package:nasa_api/widgets/space_around_field.dart';

import '../../../../main.dart';
import '../../../../widgets/apptext.dart';
import '../../../../widgets/loading.dart';
import '../../../home/data/products/modal/products.dart';

class ProductDetailScreen extends StatelessWidget {
  Products product;
  ProductDetailScreen({super.key, required this.product});
  List<Products> favList = [];
  @override
  Widget build(BuildContext context) {
    favList = BlocProvider.of<FavoritesBloc>(context).getDemoData();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: AppText(
              text: "Details",
              fontSize: 25,
              fontWeight: FontWeight.w600,
              textOverFlow: TextOverflow.ellipsis),
          actions: const [
            Icon(
              Icons.notifications_none,
              color: Colors.black,
              size: 25,
            )
          ],
        ),
        bottomNavigationBar: CommonBottomBar(
          edgeInsets: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: "Price ",
                    fontSize: 17,
                    textColor: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                  AppText(
                    text: "${AppConstants.rupeeSymbol} ${product.price}",
                    fontSize: 20,
                    textColor: Colors.black,
                    fontWeight: FontWeight.w700,
                  )
                ],
              ),
              AppTextIconButton(
                btnText: "Add To Cart",
                iconData: Icons.shopping_cart_outlined,
                width: 150,
                function: (){
                  context.read<CartBloc>().add(AddItem(cartProductModel: CartProductModel(productId: product.id,quantity: 1)));
                },
              )
            ],
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SpaceAroundField(),
                  Center(
                    child: Stack(
                      children: [
                        CustomImage(
                          imageSrc: product.image ?? "",
                          height: 400,
                          width: width,
                          boxFit: BoxFit.contain,
                        ),
                        Positioned(
                            top: 20,
                            right: 20,
                            child: BlocConsumer<FavoritesBloc, FavoritesState>(
                              listener: (context, favState) {
                                // TODO: implement listener
                              },
                              builder: (context, favState) {
                                if (favState is FavoritesLoaded) {
                                  return FavoriteButton(
                                    product: product, favList: favState.favList,
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
                  ),
                  SpaceAroundField(),
                  AppText(
                    text: product.title ?? "",
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    maxLines: 2,
                  ),
                  SpaceAroundField(
                    height: 5,
                  ),
                  Row(
                    children: [
                      StarIcon(
                        rating: product.rating,
                      ),
                      SpaceAroundField(
                        height: 0,
                        width: 5,
                      ),
                      AppText(
                        text: "(${product.rating?.count} reviews)" ?? "",
                        fontSize: 15,
                        textColor: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                        maxLines: 2,
                      ),
                    ],
                  ),
                  SpaceAroundField(
                    height: 15,
                  ),
                  AppText(
                    text: product.description ?? "",
                    fontSize: 16,
                    textColor: Colors.grey.shade800,
                    fontWeight: FontWeight.w500,
                    maxLines: 5,
                  ),
                ],
              )),
        )));
  }
}
