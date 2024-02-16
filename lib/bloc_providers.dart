import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api/features/home/presentation/bloc/picture_of_day_bloc.dart';
import 'package:nasa_api/features/splash/presentation/bloc/splashscreen_bloc.dart';

class BlocProviders {
  BlocProviders._();

  static final providers = [
    BlocProvider<SplashscreenBloc>(create: (context) => SplashscreenBloc()),
    BlocProvider<PictureOfDayBloc>(create: (context) => PictureOfDayBloc()),
  ];
}
