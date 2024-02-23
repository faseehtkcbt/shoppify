import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:nasa_api/constants/apiConstants.dart';
import 'package:nasa_api/constants/app_constants.dart';
import 'package:http/http.dart' as http;

class CategoryDataSources {
  Future<Either<ApiException, dynamic>> getCategoryDataSources() async {
    final today =
        "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";
    try {
      final response = await http.get(Uri.parse(ApiConstants.categoryUrl));
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
