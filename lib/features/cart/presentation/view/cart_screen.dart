import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api/constants/app_constants.dart';
import 'package:nasa_api/features/cart/data/model/cart_product_model.dart';
import 'package:nasa_api/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:nasa_api/features/cart/presentation/widgets/cartItem.dart';
import 'package:nasa_api/features/cart/presentation/widgets/cartPriceSection.dart';
import 'package:nasa_api/main.dart';
import 'package:nasa_api/methods/common_methods.dart';
import 'package:nasa_api/widgets/appbutton.dart';
import 'package:nasa_api/widgets/loading.dart';
import 'package:nasa_api/widgets/space_around_field.dart';

import '../../../../widgets/apptext.dart';
import '../../../home/data/products/modal/products.dart';
import '../../../home/presentation/bloc/favorites/favorites_bloc.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppText(
            text: "My Cart",
            fontSize: 28,
            fontWeight: FontWeight.w600,
            textOverFlow: TextOverflow.ellipsis),
        actions: const [],
      ),
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, cartState) {
          // TODO: implement listener
        },
        builder: (context, cartState) {
          if(cartState is CartLoaded) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: cartState.cartList.isNotEmpty ? SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListView.builder(shrinkWrap: true,itemCount: cartState.cartList.length,itemBuilder: (context,index)=>CartItem(cartProductModel: CommonMethods().getModel(cartState.cartList[index], BlocProvider.of<CartBloc>(context).cartList),product: cartState.cartList[index],)),
                      CartPriceSection(),
                      AppButton(btnText: 'CheckOut', width: width * .8,)
                    ],
                  ),
                ):Center(
                  child: AppText(text: "Cart List Empty",textColor: Colors.black,fontSize: 17),
                ),
              ));
          } else {
            return CustomLoader();
          }
        },
      ),
    );
  }

}
