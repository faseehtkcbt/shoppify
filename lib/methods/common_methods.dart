import 'package:nasa_api/features/home/data/products/modal/products.dart';

class CommonMethods {
  bool checkFavorite(List<Products> favList, Products checkData) {
    bool result = false;
    favList.forEach((element) {
      if (element.id == checkData.id) {
        result = true;
      }
    });
    return result;
  }
}
