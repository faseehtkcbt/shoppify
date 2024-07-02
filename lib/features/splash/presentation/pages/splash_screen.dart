import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api/core/utils/apptext.dart';
import 'package:nasa_api/features/splash/presentation/bloc/splashscreen_bloc.dart';
import 'package:nasa_api/main.dart';
import 'package:nasa_api/routes.dart';

import '../../../../core/constants/imageConstatnts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    context.read<SplashscreenBloc>().add(SplashScreenLoginCheck());
    return Scaffold(
      bottomNavigationBar: ElevatedButton(
          onPressed: () {},
          child: AppText(
              text: 'Get Started',
              textStyle: Theme.of(context).textTheme.bodyLarge)),
      body: SafeArea(
        child: BlocConsumer<SplashscreenBloc, SplashscreenState>(
          listener: (context, existState) {
            if (existState is ExistingLoaded) {
              if (existState.exist == true) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.homePage, (route) => false);
                });
              }
            }
            // TODO: implement listener
          },
          builder: (context, state) {
            return Center(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        ImageConstants.bgImage,
                      ),
                      fit: BoxFit.fill),
                ),
                height: height,
                width: width,
              ),
            );
          },
        ),
      ),
    );
  }
}
