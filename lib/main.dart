import 'package:flutter/material.dart';
import 'package:food_delivery_project/controllers/cart_controller.dart';
import 'package:food_delivery_project/controllers/popular_product_controller.dart';
import 'package:food_delivery_project/pages/auth/sign_in_page.dart';
import 'package:food_delivery_project/pages/auth/sign_up_page.dart';
import 'package:food_delivery_project/pages/cart/cart_page.dart';
import 'package:food_delivery_project/pages/food/popular_food_detail.dart';
import 'package:food_delivery_project/pages/food/recommended_food_detail.dart';
import 'package:food_delivery_project/pages/splash/splash_page.dart';
import 'package:food_delivery_project/routes/route_helper.dart';
import 'package:get/get.dart';

import 'controllers/recommended_product_controller.dart';
import 'pages/home/main_food_page.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          // home: SignInPage(),
          // home: SplashScreen(),
          initialRoute: RouteHelper.getSplashPage(),
          getPages: RouteHelper.routes,
        );
      });
    });
  }
}
