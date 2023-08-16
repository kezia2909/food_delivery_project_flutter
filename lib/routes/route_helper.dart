import 'package:food_delivery_project/helper/dependencies.dart';
import 'package:food_delivery_project/pages/auth/sign_in_page.dart';
import 'package:food_delivery_project/pages/cart/cart_page.dart';
import 'package:food_delivery_project/pages/food/popular_food_detail.dart';
import 'package:food_delivery_project/pages/food/recommended_food_detail.dart';
import 'package:food_delivery_project/pages/home/home_page.dart';
import 'package:food_delivery_project/pages/home/main_food_page.dart';
import 'package:food_delivery_project/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";
  static const String signIn = "/sign-in";

  static String getSplashPage() => splashPage;
  static String getInitial() => initial;
  static String getPopularFood(int index, String page) =>
      '$popularFood?index=$index&page=$page';
  static String getRecommendedFood(int index, String page) =>
      '$recommendedFood?index=$index&page=$page';
  static String getCartPage() => cartPage;
  static String getSignInPage() => signIn;

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),
    GetPage(
        name: signIn, page: () => SignInPage(), transition: Transition.fade),
    GetPage(
        name: popularFood,
        page: () {
          var index = Get.parameters['index'];
          var page = Get.parameters['page'];
          return PopularFoodDetail(index: int.parse(index!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var index = Get.parameters['index'];
          var page = Get.parameters['page'];

          return RecommendedFoodDetail(index: int.parse(index!), page: page!);
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
