import 'package:food_delivery_project/controllers/auth_controller.dart';
import 'package:food_delivery_project/controllers/cart_controller.dart';
import 'package:food_delivery_project/controllers/popular_product_controller.dart';
import 'package:food_delivery_project/controllers/recommended_product_controller.dart';
import 'package:food_delivery_project/data/api/api_client.dart';
import 'package:food_delivery_project/data/repository/auth_repo.dart';
import 'package:food_delivery_project/data/repository/cart_repo.dart';
import 'package:food_delivery_project/data/repository/popular_product_repo.dart';
import 'package:food_delivery_project/data/repository/recommended_product_repo.dart';
import 'package:food_delivery_project/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);

  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  // repository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  // controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
}
