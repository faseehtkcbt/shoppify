import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:nasa_api/constants/app_constants.dart';
import 'package:nasa_api/features/home/data/datasources/picture_of_day_datasource.dart';
import 'package:nasa_api/features/home/data/modal/pictureofday.dart';

class PictureOfDayRepositories {
  Future<Either<ApiException, PictureOfDay>>
      getPictureOfDayRepositories() async {
    final response =
        await PictureOfDayDataSources().getPictureOfDayDataSources();
    var resp;
    response.fold((l) => resp = l, (r) => resp = r);
    if (response.isRight()) {
      final data = PictureOfDay.fromJson(jsonDecode(resp));
      return Right(data);
    } else {
      return Left(resp);
    }
  }
}
