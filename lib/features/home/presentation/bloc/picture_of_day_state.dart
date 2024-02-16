part of 'picture_of_day_bloc.dart';

@immutable
abstract class PictureOfDayState {}

class PictureOfDayLoaded extends PictureOfDayState {
  PictureOfDay data;
  PictureOfDayLoaded(this.data);
}

class PictureOfDayError extends PictureOfDayState {
  ApiException exception;
  PictureOfDayError(this.exception);
}

class PictureOfDayLoading extends PictureOfDayState {}
