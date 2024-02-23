import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:nasa_api/constants/app_constants.dart';

import '../datasource/category_datasource.dart';

class CategoryRepositories {
  Future<Either<ApiException, List<String>>> getCategoryRepositories() async {
    final response = await CategoryDataSources().getCategoryDataSources();
    var resp;
    response.fold((l) => resp = l, (r) => resp = r);
    List<String> data = <String>[];
    if (response.isRight()) {
      if (resp != null) {
        resp.forEach((v) {
          data.add(v);
        });
      }
      return Right(data);
    } else {
      return Left(resp);
    }
  }
}
