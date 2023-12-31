import 'package:flutter/material.dart';
import 'package:food_delivery_project/controllers/cart_controller.dart';
import 'package:food_delivery_project/data/repository/popular_product_repo.dart';
import 'package:food_delivery_project/models/cart_model.dart';
import 'package:food_delivery_project/models/products_model.dart';
import 'package:food_delivery_project/utils/colors.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print("success get popular products");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      // print(_popularProductList);
      _isLoaded = true;

      update();
    } else {
      print("couldn't get popular products");
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
      print("add quantity $_quantity");
    } else {
      _quantity = checkQuantity(_quantity - 1);
      print("remove quantity $_quantity");
    }
    update();
  }

  checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar("Item count", "You can't reduce more !",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 0 - _inCartItems;
    } else if ((_inCartItems + quantity) > 20) {
      Get.snackbar("Item count", "You can't add more !",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 20 - _inCartItems;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    // if exist
    var exist = false;
    exist = _cart.existInCart(product);
    print("exist or not : " + exist.toString());
    // get data from storage
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
    print("the quantity in cart is : " + _inCartItems.toString());
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);

    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);

    _cart.items.forEach(
      (key, value) {
        print("id : " +
            value.id.toString() +
            " - qty : " +
            value.quantity.toString());
      },
    );

    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
