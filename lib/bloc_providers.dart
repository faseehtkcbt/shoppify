import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api/features/authentication/login/presentation/bloc/login_bloc.dart';
import 'package:nasa_api/features/authentication/registration/presentation/bloc/register_bloc.dart';
import 'package:nasa_api/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:nasa_api/features/home/presentation/bloc/catogories/category_bloc.dart';
import 'package:nasa_api/features/home/presentation/bloc/favorites/favorites_bloc.dart';
import 'package:nasa_api/features/home/presentation/bloc/navigation/navigation_bloc.dart';
import 'package:nasa_api/features/home/presentation/bloc/products_bloc.dart';
import 'package:nasa_api/features/home/presentation/bloc/searchProducts/searched_products_bloc.dart';
import 'package:nasa_api/features/splash/presentation/bloc/splashscreen_bloc.dart';

class BlocProviders {
  BlocProviders._();

  static final providers = [
    BlocProvider<SplashscreenBloc>(create: (context) => SplashscreenBloc()),
    BlocProvider<ProductsBloc>(create: (context) => ProductsBloc()),
    BlocProvider<CategoryBloc>(create: (context) => CategoryBloc()),
    BlocProvider<SearchedProductsBloc>(
        create: (context) => SearchedProductsBloc()),
    BlocProvider<FavoritesBloc>(create: (context) => FavoritesBloc()),
    BlocProvider<NavigationBloc>(create: (context)=>NavigationBloc()),
    BlocProvider<CartBloc>(create: (context) => CartBloc()),
    BlocProvider<LoginBloc>(create: (context)=>LoginBloc()),
    BlocProvider<RegisterBloc>(create: (context)=>RegisterBloc())


  ];
}
