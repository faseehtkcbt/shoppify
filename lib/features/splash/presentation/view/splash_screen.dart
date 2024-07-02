import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api/constants/app_constants.dart';
import 'package:nasa_api/constants/imageConstatnts.dart';
import 'package:nasa_api/features/splash/presentation/bloc/splashscreen_bloc.dart';
import 'package:nasa_api/main.dart';
import 'package:nasa_api/routes.dart';
import 'package:nasa_api/widgets/appbutton.dart';
import 'package:nasa_api/widgets/apptext.dart';
import 'package:nasa_api/widgets/common_bottom_bar.dart';
import 'package:nasa_api/widgets/decoration.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    context.read<SplashscreenBloc>().add(SplashScreenLoginCheck());
    return Scaffold(
      bottomNavigationBar: CommonBottomBar(
        widget: AppButton(
          btnText: "Get Started",
          btnColor: Colors.blueAccent,
          function: () {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.login, (route) => false);
          },
        ),
        edgeInsets:
            const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      ),
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
                decoration: BoxDecoration(
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
