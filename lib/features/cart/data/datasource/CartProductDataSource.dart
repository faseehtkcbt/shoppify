import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:nasa_api/constants/apiConstants.dart';
import 'package:nasa_api/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:nasa_api/features/cart/data/model/cart_product_model.dart';

class CartProductDataSource {
  Future<Either<ApiException, dynamic>> getCartProductDataSources({required CartProductModel cartProductModel}) async {
    final today =
        "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";
    try {
      final response = await http.get(Uri.parse("${ApiConstants.productsUrl}/${cartProductModel.productId}"));
      if (response.statusCode == 200) {
        return Right(jsonDecode(response.body));
      } else {
        return const Left(ApiException.serverException);
      }
    } catch (e) {
      return const Left(ApiException.networkException);
    }
  }
}
