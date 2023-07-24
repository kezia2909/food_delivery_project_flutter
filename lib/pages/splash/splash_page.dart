import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery_project/utils/dimensions.dart';
import 'package:food_delivery_project/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../routes/route_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState() {
    super.initState();

    _loadResource();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..forward();
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    );
    Timer(
      Duration(seconds: 3),
      () => Get.offNamed(RouteHelper.getInitial()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Image.asset(
                "assets/image/logo.png",
                width: Dimensions.width200,
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height20,
          ),
          BigText(
            text: "Delicious Food",
            size: Dimensions.font26 * 1.5,
          )
        ],
      ),
    );
  }
}
