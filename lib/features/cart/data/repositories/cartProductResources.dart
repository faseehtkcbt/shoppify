import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:nasa_api/constants/app_constants.dart';
import 'package:nasa_api/features/cart/data/datasource/CartProductDataSource.dart';

import '../../../home/data/products/modal/products.dart';
import '../model/cart_product_model.dart';



class CartProductRepositories {
  Future<Either<ApiException, Products>> getCartProductRepositories({required CartProductModel cartProductModel}) async {
    final response = await CartProductDataSource().getCartProductDataSources(cartProductModel: cartProductModel);
    var resp;
    response.fold((l) => resp = l, (r) => resp = r);

    if (response.isRight()) {
      print(resp);

      Products data = Products.fromJson(resp);
      return Right(data);
    } else {
      return Left(resp);
    }
  }
}
