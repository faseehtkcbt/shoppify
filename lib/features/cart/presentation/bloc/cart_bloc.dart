import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:nasa_api/features/cart/data/db/cartdb.dart';
import 'package:nasa_api/features/cart/data/repositories/cartProductResources.dart';

import '../../../../constants/app_constants.dart';
import '../../../home/data/products/modal/products.dart';
import '../../data/model/cart_product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  List<CartProductModel> _cartList = [];
  List<CartProductModel> get cartList => _cartList;
  CartBloc() : super(CartInitial()) {
    on<AddItem>((event, emit) async {
      emit(CartInitial());
      var response = await DatabaseHelper.instance.getCartProducts();
      if (!(response.contains(event.cartProductModel))) {
        _cartList.add(event.cartProductModel);
        await DatabaseHelper.instance
            .insertCartProduct(event.cartProductModel)
            .then((value) => print(value));
      }
      add(GetCartItem());
    });
    on<RemoveItem>((event, emit) async {
      emit(CartInitial());
      _cartList.forEach((element) {
        if (element.productId == event.cartProductModel.productId) {
          _cartList.remove(element);
        }
      });
      await DatabaseHelper.instance
          .deleteCartProduct(event.cartProductModel?.productId ?? 0)
          .then((value) => print(value));
      add(GetCartItem());
    });
    on<GetCartItem>((event, emit) async {
      emit(CartInitial());
      var response = await DatabaseHelper.instance.getCartProducts();
      List<Products> cartList = [];
      response.forEach((element) async {
        var result = await CartProductRepositories()
            .getCartProductRepositories(cartProductModel: element);
        var resp;
        result.fold((l) => resp = l, (r) => resp = r);
        cartList.add(resp);
      });


      emit(CartLoaded(cartList: cartList));
    });

    on<IncrementCount>((event, emit) async {
      emit(CartInitial());
      await DatabaseHelper.instance
          .updateCartProduct(CartProductModel(quantity:event.cartProductModel.quantity!+
          1,productId:event.cartProductModel.productId  ))
          .then((value) => _cartList.forEach((element) {
        if (element.productId == event.cartProductModel.productId) {
          _cartList.remove(element);
          _cartList.add(CartProductModel(productId: element.productId,quantity: element.quantity!+1));
        }
      }));
      add(GetCartItem());
    });

    on<DecrementCount>((event, emit) async {
      emit(CartInitial());
      await DatabaseHelper.instance
          .updateCartProduct(CartProductModel(quantity:event.cartProductModel.quantity!-1,productId:event.cartProductModel.productId  ))
          .then((value) => _cartList.forEach((element) {
        if (element.productId == event.cartProductModel.productId) {
          _cartList.remove(element);
          _cartList.add(CartProductModel(productId: element.productId,quantity: element.quantity!-1));
        }
      }));
      add(GetCartItem());
    });
  }
}
