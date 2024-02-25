import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api/features/home/presentation/bloc/favorites/favorites_bloc.dart';
import 'package:nasa_api/widgets/loading.dart';

import '../../../../../widgets/apptext.dart';
import '../widgets/products_grid_view.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppText(
            text: "Favorites",
            fontSize: 28,
            fontWeight: FontWeight.w600,
            textOverFlow: TextOverflow.ellipsis),
        actions: const [
        ],
      ),
      body: BlocConsumer<FavoritesBloc, FavoritesState>(
        listener: (context, favState) {
          // TODO: implement listener
        },
        builder: (context, favState) {
          if (favState is FavoritesLoaded) {
            return SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ProductsGridView(
                products: favState.favList ?? [],
              ),
            ));
          } else {
            return CustomLoader();
          }
        },
      ),
    );
  }
}
