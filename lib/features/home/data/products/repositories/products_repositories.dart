import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:nasa_api/constants/app_constants.dart';

import '../datasources/products_datasource.dart';
import '../modal/products.dart';

class ProductsRepositories {
  Future<Either<ApiException, List<Products>>> getProductsRepositories() async {
    final response = await ProductsDataSources().getProductsDataSources();
    var resp;
    response.fold((l) => resp = l, (r) => resp = r);
    List<Products> data = <Products>[];
    if (response.isRight()) {
      if (resp != null) {
        resp.forEach((v) {
          data.add(Products.fromJson(v));
        });
      }
      return Right(data);
    } else {
      return Left(resp);
    }
  }
}
