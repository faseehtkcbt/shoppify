import 'package:flutter/material.dart';
import 'package:nasa_api/features/authentication/login/presentation/view/login.dart';
import 'package:nasa_api/features/authentication/registration/presentation/view/registerscreen.dart';
import 'package:nasa_api/features/home/data/products/modal/products.dart';
import 'package:nasa_api/features/home/presentation/view/homePage.dart';
import 'package:nasa_api/features/product_detail/presentation/view/product_detail_screen.dart';

import 'features/home/presentation/view/screens/homeScreen.dart';

class Routes {
  Routes._();
  static const String homeScreenPage = '/picture-day-page';
  static const String productDetailScreen = '/product-detail-screen';
  static const String homePage = '/home-page';
  static const String login = '/login';
  static const String register = '/register';


  static final dynamic routes = <String, WidgetBuilder>{
    homeScreenPage: (BuildContext context) => HomeScreenPage(),
    homePage: (BuildContext context) => HomePage(),
    login : (BuildContext context) =>LoginPage(),
    register : (BuildContext context) =>RegisterPage(),

    productDetailScreen: (BuildContext context) {
      final args = ModalRoute.of(context)?.settings.arguments as Products;
      return ProductDetailScreen(product: args);
    },
  };
}
