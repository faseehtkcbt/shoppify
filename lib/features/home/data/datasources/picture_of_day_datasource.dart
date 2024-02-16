import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:nasa_api/constants/apiConstants.dart';
import 'package:nasa_api/constants/app_constants.dart';
import 'package:http/http.dart' as http;

class PictureOfDayDataSources {
  Future<Either<ApiException, dynamic>> getPictureOfDayDataSources() async {
    final today =
        "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";
    try {
      final response = await http.get(Uri.parse(
          "https://api.nasa.gov/neo/rest/v1/neo/3542519?api_key=7xhmQABhE0mPIinWOAIxcca1cEfTTgbRwY5KZuGo&asteroid_id=3309828"));

      if (response.statusCode == 200) {
        return Right(response.body);
      } else {
        return const Left(ApiException.serverException);
      }
    } catch (e) {
      return const Left(ApiException.networkException);
    }
  }
}
