import 'dart:convert';

import 'package:food_delivery_project/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  List<String> cartHistory = [];

  void addToCartList(List<CartModel> cartList) {
    // sharedPreferences.remove(AppConstants.CART_LIST);
    // sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);
    var time = DateTime.now().toString();
    cart = [];
    // convert obj to string
    // shared preferences only accept string

    cartList.forEach((element) {
      element.time = time;
      return cart.add(jsonEncode(element));
    });

    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);

    print("add to shared preferences");
    print(sharedPreferences.getStringList(AppConstants.CART_LIST));
    // getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      print("inside getCartList" + carts.toString());
    }
    List<CartModel> cartList = [];

    carts.forEach(
        (element) => cartList.add(CartModel.fromJson(jsonDecode(element))));
    print("get from shared preferences");

    return cartList;
  }

  List<CartModel> getCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)) {
      cartHistory = [];
      cartHistory =
          sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    List<CartModel> cartHistoryList = [];
    cartHistory.forEach((element) =>
        (cartHistoryList.add(CartModel.fromJson(jsonDecode(element)))));

    return cartHistoryList;
  }

  void addToCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)) {
      cartHistory =
          sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }

    for (int i = 0; i < cart.length; i++) {
      print("history list " + cart[i]);
      cartHistory.add(cart[i]);
    }
    removeCart();

    sharedPreferences.setStringList(
        AppConstants.CART_HISTORY_LIST, cartHistory);

    print("the length of history list : " +
        getCartHistoryList().length.toString());

    for (int i = 0; i < getCartHistoryList().length; i++) {
      print("time : " + getCartHistoryList()[i].time.toString());
    }
  }

  void removeCart() {
    cart = [];
    sharedPreferences.remove(AppConstants.CART_LIST);
  }

  void clearCardHistory() {
    removeCart();
    cartHistory = [];
    sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);
  }
}
