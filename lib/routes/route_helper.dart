import 'package:food_delivery_project/helper/dependencies.dart';
import 'package:food_delivery_project/pages/cart/cart_page.dart';
import 'package:food_delivery_project/pages/food/popular_food_detail.dart';
import 'package:food_delivery_project/pages/food/recommended_food_detail.dart';
import 'package:food_delivery_project/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";

  static String getInitial() => initial;
  static String getPopularFood(int index) => '$popularFood?index=$index';
  static String getRecommendedFood(int index) =>
      '$recommendedFood?index=$index';
  static String getCartPage() => cartPage;

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainFoodPage()),
    GetPage(
        name: popularFood,
        page: () {
          var index = Get.parameters['index'];
          return PopularFoodDetail(index: int.parse(index!));
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var index = Get.parameters['index'];
          return RecommendedFoodDetail(index: int.parse(index!));
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartPage,
        page: () {
          print("aaaaa");
          return CartPage();
        },
        transition: Transition.fadeIn)
  ];
}
