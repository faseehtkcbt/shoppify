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
          function: (){
            Navigator.pushNamedAndRemoveUntil(context, Routes.login, (route) => false);
          },
        ),
        edgeInsets:
            const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      ),
      body: BlocConsumer<SplashscreenBloc, SplashscreenState>(
        listener: (context, existState) {
          if (existState is ExistingLoaded) {
            if (existState.exist == true) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushNamedAndRemoveUntil(context, Routes.homePage, (route) => false);
              });
            }
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          return Center(
            child: Container(
                height: height,
                width: width,
                child: Stack(
                  children: [
                    Positioned(
                        bottom: 0,
                        right: -100,
                        child: Image.asset(
                          ImageConstants.bgImage,
                          fit: BoxFit.fill,
                          height: height*0.75,
                          width: 450,
                        )),
                    Positioned(
                      top: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: SizedBox(
                          width: width * 0.9,
                          child: AppText(
                              text: "Define yourself in your unique way.",
                              fontSize: 45,
                              textColor: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontFamily: AppConstants.poppinsFont,
                              maxLines: 3),
                        ),
                      ),
                    )
                  ],
                )),
          );
        },
      ),
    );
  }
}
