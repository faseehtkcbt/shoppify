import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:nasa_api/methods/common_methods.dart';

import '../../../../constants/app_constants.dart';
import '../../../../main.dart';
import '../../../../widgets/apptext.dart';
import '../../../../widgets/customImage.dart';
import '../../../../widgets/decoration.dart';
import '../../../../widgets/space_around_field.dart';
import '../../../home/data/products/modal/products.dart';
import '../../../home/presentation/bloc/favorites/favorites_bloc.dart';
import '../../data/model/cart_product_model.dart';

class CartItem extends StatelessWidget {
  Products? product;
  CartProductModel? cartProductModel;
   CartItem({super.key,required this.product,required this.cartProductModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding:const EdgeInsets.all(10),
      width: width,
      decoration: customDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomImage(imageSrc:product?.image ?? "" ,boxFit: BoxFit.contain,
                borderRadius: BorderRadius.circular(10),height: 80,
                width: 70,
                padding: const EdgeInsets.all(5),),
              SpaceAroundField(width: 10,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(text: product?.title ?? "",fontSize: 13,fontWeight: FontWeight.w600,maxLines: 2,),
                    AppText(text: "${AppConstants.rupeeSymbol} ${product?.price}" ?? "",textColor: Colors.grey.shade600,fontSize: 12,fontWeight: FontWeight.w500,maxLines: 2,),
                    SpaceAroundField(),SizedBox(
                      height: 20,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 25,
                            width: 25,
                            decoration: customDecoration(
                                color: Colors.transparent,
                                boxBorder: Border.all(
                                    color: Colors.black,
                                    width: 0.5
                                ),borderRadius: BorderRadius.circular(3)
                            ),
                            child: Center(child: AppText(text: "-" ?? "",textColor: Colors.black,fontSize: 14,fontWeight: FontWeight.w700,maxLines: 2,)),


                          ),
                          SpaceAroundField(
                            width: 5,
                          ),
                          AppText(text: "100" ?? "",textColor: Colors.black,fontSize: 12,fontWeight: FontWeight.w500,maxLines: 2,),
                          SpaceAroundField(
                            width: 5,
                          ),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: customDecoration(
                                color: Colors.transparent,
                                boxBorder: Border.all(
                                    color: Colors.black,
                                    width: 0.5
                                ),borderRadius: BorderRadius.circular(3)
                            ),
                            child: Center(child: AppText(text: "+" ?? "",textColor: Colors.black,fontSize: 14,fontWeight: FontWeight.w700,maxLines: 2,)),

                          )


                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Positioned(top:10,right:0,child: GestureDetector(onTap: (){context.read<CartBloc>().add(RemoveItem(cartProductModel: CommonMethods().getModel(product!, BlocProvider.of<CartBloc>(context).cartList),));},child: Icon(Icons.delete_outline,color: Colors.red,size: 20,)))
        ],
      ),
    );
  }
}
