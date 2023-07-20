import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.64;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;

  // dynamic height padding & margin
  static double height5 = screenHeight / 168.8;
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.76;
  static double height100 = screenHeight / 8.44;
  static double height120 = screenHeight / 7.03;
  static double height300 = screenHeight / 2.81;

  // dynamic width padding & margin
  static double width5 = screenHeight / 168.8;
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;
  static double width45 = screenHeight / 18.76;
  static double width200 = screenHeight / 4.22;

  // font size
  static double font12 = screenHeight / 70.33;
  static double font16 = screenHeight / 52.75;
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.46;

  // radius
  static double radius5 = screenHeight / 168.8;
  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

  // icon size
  static double iconSize16 = screenHeight / 52.75;
  static double iconSize24 = screenHeight / 35.17;

  // image size
  static double listViewImageSize = screenWidth / 3.25;
  static double listViewTextContainerSize = screenWidth / 3.9;
  static double popularFoodImageSize = screenHeight / 2.41;
}
