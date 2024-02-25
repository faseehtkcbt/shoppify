import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api/features/cart/presentation/view/cart_screen.dart';
import 'package:nasa_api/features/home/presentation/view/screens/favoriteScreen.dart';
import 'package:nasa_api/features/home/presentation/view/screens/homeScreen.dart';
import 'package:nasa_api/features/home/presentation/view/widgets/custom_bottom_bar_item.dart';
import 'package:nasa_api/widgets/apptext.dart';
import 'package:nasa_api/widgets/common_bottom_bar.dart';

import '../bloc/navigation/navigation_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Widget> screens = [HomeScreenPage(), FavoriteScreen(), CartScreen()];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationBloc, NavigationState>(
      listener: (context, navState) {
        // TODO: implement listener
      },
      builder: (context, navState) {
        final state =
            BlocProvider.of<NavigationBloc>(context).state as NavigationInitial;
        return Scaffold(
          bottomNavigationBar: CommonBottomBar(
            widget: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomBottomBarItem(
                  icon: Icons.home_outlined,
                  label: 'Home',
                  selected: state.currentIndex == 0,
                  onTap: () {
                    context
                        .read<NavigationBloc>()
                        .add(ChangeBar(currentIndex: 0));
                  },
                ),
                CustomBottomBarItem(
                  icon: Icons.favorite_outline,
                  label: 'Favorites',
                  selected: state.currentIndex == 1,
                  onTap: () {
                    context
                        .read<NavigationBloc>()
                        .add(ChangeBar(currentIndex: 1));
                  },
                ),
                CustomBottomBarItem(
                  icon: Icons.shopping_cart_outlined,
                  label: 'Cart',
                  selected: state.currentIndex == 2,
                  onTap: () {
                    context
                        .read<NavigationBloc>()
                        .add(ChangeBar(currentIndex: 2));
                  },
                ),
              ],
            )),
            height: 70,
          ),
          body: screens[state.currentIndex],
        );
      },
    );
  }
}
