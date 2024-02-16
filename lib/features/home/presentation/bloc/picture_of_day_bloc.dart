import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nasa_api/constants/app_constants.dart';
import 'package:nasa_api/features/home/data/repositories/picture_of_day_repositories.dart';

import '../../data/modal/pictureofday.dart';

part 'picture_of_day_event.dart';
part 'picture_of_day_state.dart';

class PictureOfDayBloc extends Bloc<PictureOfDayEvent, PictureOfDayState> {
  PictureOfDayBloc() : super(PictureOfDayLoading()) {
    on<GetPictureOfDay>((event, emit) async {
      final response =
          await PictureOfDayRepositories().getPictureOfDayRepositories();
      var resp;
      response.fold((l) => resp = l, (r) => resp = r);
      if (response.isRight()) {
        emit(PictureOfDayLoaded(resp));
      } else {
        emit(PictureOfDayError(resp));
      }
      // TODO: implement event handler
    });
  }
}
