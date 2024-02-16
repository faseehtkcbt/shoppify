import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api/constants/app_constants.dart';
import 'package:nasa_api/constants/imageConstatnts.dart';
import 'package:nasa_api/features/home/data/datasources/picture_of_day_datasource.dart';
import 'package:nasa_api/features/splash/presentation/bloc/splashscreen_bloc.dart';
import 'package:nasa_api/routes.dart';
import 'package:nasa_api/widgets/apptext.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SplashscreenBloc>().add(SplashScreenLoginCheck());
    return Scaffold(
      body: BlocConsumer<SplashscreenBloc, SplashscreenState>(
        listener: (context, state) {
          if (state is SplashscreenInitial) {
            if (state.login == true) {
              Navigator.pushNamed(context, Routes.pictureDayPage);
            }
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          return Center(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageConstants.bgImage),
                      fit: BoxFit.cover)),
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: AppText(
                  text: AppConstants.appName,
                  textColor: Colors.white,
                  fontSize: 100,
                  fontFamily: 'sofadi',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
