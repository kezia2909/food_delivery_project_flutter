import 'package:flutter/material.dart';
import 'package:food_delivery_project/base/no_data_page.dart';
import 'package:food_delivery_project/controllers/auth_controller.dart';
import 'package:food_delivery_project/controllers/cart_controller.dart';
import 'package:food_delivery_project/controllers/popular_product_controller.dart';
import 'package:food_delivery_project/controllers/recommended_product_controller.dart';
import 'package:food_delivery_project/pages/home/main_food_page.dart';
import 'package:food_delivery_project/utils/app_constants.dart';
import 'package:food_delivery_project/utils/colors.dart';
import 'package:food_delivery_project/utils/dimensions.dart';
import 'package:food_delivery_project/widgets/app_icon.dart';
import 'package:food_delivery_project/widgets/big_text.dart';
import 'package:food_delivery_project/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../routes/route_helper.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // header
          Positioned(
            top: Dimensions.height20 * 3,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
                SizedBox(
                  width: Dimensions.width10 * 10,
                ),
                GestureDetector(
                  onTap: () => (Get.toNamed(RouteHelper.getInitial())),
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),
          // body
          GetBuilder<CartController>(builder: (_cartController) {
            return _cartController.getItems.length > 0
                ? Positioned(
                    top: Dimensions.height100,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: 0,
                    child: Container(
                      margin: EdgeInsets.only(top: Dimensions.height15),
                      // color: Colors.red,
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: GetBuilder<CartController>(
                            builder: (cartController) {
                          var _cartList = cartController.getItems;
                          return ListView.builder(
                            itemCount: _cartList.length,
                            itemBuilder: (_, index) {
                              return Container(
                                height: Dimensions.height100,
                                width: double.maxFinite,
                                // color: Colors.blue,
                                margin:
                                    EdgeInsets.only(bottom: Dimensions.width10),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        var popularIndex =
                                            Get.find<PopularProductController>()
                                                .popularProductList
                                                .indexOf(
                                                    _cartList[index].product!);
                                        if (popularIndex >= 0) {
                                          Get.toNamed(
                                              RouteHelper.getPopularFood(
                                                  popularIndex, "cartpage"));
                                        } else {
                                          var recommendedIndex = Get.find<
                                                  RecommendedProductController>()
                                              .recommendedProductList
                                              .indexOf(
                                                  _cartList[index].product!);
                                          if (recommendedIndex < 0) {
                                            Get.snackbar("history product",
                                                "product review is not available for history product",
                                                backgroundColor:
                                                    AppColors.mainColor,
                                                colorText: Colors.white);
                                          } else {
                                            Get.toNamed(
                                                RouteHelper.getRecommendedFood(
                                                    recommendedIndex,
                                                    "cartpage"));
                                          }
                                        }
                                      },
                                      child: Container(
                                        width: Dimensions.height100,
                                        height: Dimensions.height100,
                                        margin: EdgeInsets.only(
                                            bottom: Dimensions.height10),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                AppConstants.BASE_URL +
                                                    AppConstants.UPLOAD_URL +
                                                    _cartList[index].img!),
                                          ),
                                          // color: Colors.yellow,
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radius20),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: Dimensions.width10),
                                    Expanded(
                                      child: Container(
                                        // color: Colors.green,
                                        height: Dimensions.height100,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            BigText(
                                              text: _cartList[index].name!,
                                              color: Colors.black54,
                                            ),
                                            SmallText(
                                              text: "Spicy",
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                BigText(
                                                  text:
                                                      "\$ ${_cartList[index].price}",
                                                  color: Colors.redAccent,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                    top: Dimensions.height10,
                                                    bottom: Dimensions.height10,
                                                    left: Dimensions.width10,
                                                    right: Dimensions.width10,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Dimensions
                                                                .radius20),
                                                    color: Colors.white,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          cartController
                                                              .addItem(
                                                                  _cartList[
                                                                          index]
                                                                      .product!,
                                                                  -1);
                                                        },
                                                        child: Icon(
                                                          Icons.remove,
                                                          color: AppColors
                                                              .signColor,
                                                          // size: Dimensions.iconSize24,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            Dimensions.width5,
                                                      ),
                                                      BigText(
                                                        text:
                                                            "${_cartList[index].quantity}",
                                                        // text: popularProduct.inCartItems
                                                        //     .toString(),
                                                        // size: Dimensions.font12,
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            Dimensions.width5,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          cartController
                                                              .addItem(
                                                                  _cartList[
                                                                          index]
                                                                      .product!,
                                                                  1);
                                                        },
                                                        child: Icon(
                                                          Icons.add,
                                                          color: AppColors
                                                              .signColor,
                                                          // size: Dimensions.iconSize24,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        }),
                      ),
                    ),
                  )
                : Positioned(
                    top: Dimensions.height100,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: 0,
                    child: NoDataPage(
                      text: "your cart is empty!",
                    ),
                  );
          }),
        ],
      ),
      // bottom bar
      bottomNavigationBar:
          GetBuilder<CartController>(builder: (cartController) {
        return cartController.getItems.length > 0
            ? Container(
                height: Dimensions.height120,
                padding: EdgeInsets.only(
                  top: Dimensions.height30,
                  bottom: Dimensions.height30,
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                ),
                decoration: BoxDecoration(
                  color: AppColors.buttonBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                    topRight: Radius.circular(Dimensions.radius20 * 2),
                  ),
                ),
                child: cartController.getItems.length > 0
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              top: Dimensions.height10,
                              bottom: Dimensions.height10,
                              left: Dimensions.width10,
                              right: Dimensions.width10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Dimensions.width5,
                                ),
                                BigText(
                                  text: "\$ " +
                                      cartController.totalAmount.toString(),
                                  // size: Dimensions.font12,
                                ),
                                SizedBox(
                                  width: Dimensions.width5,
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // popularProduct.addItem(product);
                              if (Get.find<AuthController>().userLoggedIn()) {
                                print("CHECK OUT");
                                cartController.addToHistory();
                              } else {
                                Get.toNamed(RouteHelper.getSignInPage());
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                top: Dimensions.height20,
                                bottom: Dimensions.height20,
                                left: Dimensions.width20,
                                right: Dimensions.width20,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20),
                                  color: AppColors.mainColor),
                              child: BigText(
                                text: "Check Out",
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )
                    : Container(),
              )
            : Container(
                height: 0,
              );
      }),
    );
  }
}
