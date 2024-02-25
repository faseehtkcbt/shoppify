import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:nasa_api/features/home/data/products/modal/products.dart';

import '../constants/app_constants.dart';
import '../features/cart/data/model/cart_product_model.dart';

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

  bool isEmailValid(String email) {
    // Simple email validation using a regular expression
    // Modify the regular expression pattern as per your requirements
    const emailRegex =
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';
    final regExp = RegExp(emailRegex);
    return regExp.hasMatch(email);
  }

  Future<ConnectionType> checkInternetConnection() async {
    ConnectivityResult internetconnectivity;
    ConnectionType connectionType=ConnectionType.None;
    await Connectivity().checkConnectivity().then( (event)
    {  if(event == ConnectivityResult.wifi ){
      connectionType=ConnectionType.Wifi;
    }
    else if(event == ConnectivityResult.mobile){

      connectionType=ConnectionType.Mobile;
    }
    else if(event == ConnectivityResult.none){
      connectionType=ConnectionType.None;
    }
    });
    return connectionType;

  }

  CartProductModel getModel(Products products,List<CartProductModel> list){
    var cartModel;
    list.forEach((element) {if(products.id == element.productId){
      cartModel= element;
    }});
    return cartModel;
  }
}
