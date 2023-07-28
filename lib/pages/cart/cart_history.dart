import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery_project/controllers/cart_controller.dart';
import 'package:food_delivery_project/models/cart_model.dart';
import 'package:food_delivery_project/routes/route_helper.dart';
import 'package:food_delivery_project/utils/app_constants.dart';
import 'package:food_delivery_project/utils/colors.dart';
import 'package:food_delivery_project/utils/dimensions.dart';
import 'package:food_delivery_project/widgets/app_icon.dart';
import 'package:food_delivery_project/widgets/big_text.dart';
import 'package:food_delivery_project/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList =
        Get.find<CartController>().getCartHistoryList().reversed.toList();
    Map<String, int> cartItemsPerOrder = Map();

    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    // print(cartItesPerOrder);

    List<int> cartItemsPerOrderToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<String> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }

    List<int> itemsPerOrder = cartItemsPerOrderToList();

    var listCounter = 0;
    // for (int x = 0; x < cartItemsPreOrder.length; x++) {
    //   for (int y = 0; y < orderTimes[x]; y++) {
    //     print("loop y : " + y.toString());
    //     print("my order is" + getCartHistoryList[saveCounter++].toString());
    //   }
    // }

    return Scaffold(
      body: Column(
        children: [
          Container(
            color: AppColors.mainColor,
            width: double.maxFinite,
            height: Dimensions.height100,
            padding: EdgeInsets.only(top: Dimensions.height45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(
                  text: "Cart History",
                  color: Colors.white,
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: AppColors.mainColor,
                  backgroundColor: AppColors.yellowColor,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                top: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView(
                  children: [
                    for (int i = 0; i < itemsPerOrder.length; i++)
                      Container(
                        height: Dimensions.height120,
                        margin: EdgeInsets.only(bottom: Dimensions.height20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (() {
                              DateTime parseDate =
                                  DateFormat("yyy-MM-dd HH:mm:ss").parse(
                                      getCartHistoryList[listCounter].time!);

                              var inputDate =
                                  DateTime.parse(parseDate.toString());
                              var outputFormat =
                                  DateFormat("MM/dd/yyy hh:mm a");
                              var outputDate = outputFormat.format(inputDate);
                              return BigText(text: outputDate);
                            }()),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Wrap(
                                  direction: Axis.horizontal,
                                  children:
                                      List.generate(itemsPerOrder[i], (index) {
                                    if (listCounter <
                                        getCartHistoryList.length) {
                                      listCounter++;
                                    }
                                    return index <= 2
                                        ? Container(
                                            height: Dimensions.height100 * 0.8,
                                            width: Dimensions.height100 * 0.8,
                                            margin: EdgeInsets.only(
                                                right: Dimensions.width5),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius15 / 2),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  AppConstants.BASE_URL +
                                                      AppConstants.UPLOAD_URL +
                                                      getCartHistoryList[
                                                              listCounter - 1]
                                                          .img!,
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container();
                                  }),
                                ),
                                Container(
                                  height: Dimensions.height100 * 0.8,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        SmallText(
                                          text: "Total",
                                          color: AppColors.titleColor,
                                        ),
                                        BigText(
                                          text: itemsPerOrder[i].toString() +
                                              " Items",
                                          color: AppColors.titleColor,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            var orderTime =
                                                cartOrderTimeToList();
                                            // print("order tme : " +
                                            //     orderTime[i].toString());
                                            Map<int, CartModel> moreOrder = {};
                                            print(
                                                "============================");
                                            for (int j = 0;
                                                j < getCartHistoryList.length;
                                                j++) {
                                              if (getCartHistoryList[j].time ==
                                                  orderTime[i]) {
                                                moreOrder.putIfAbsent(
                                                    getCartHistoryList[j].id!,
                                                    () => CartModel.fromJson(
                                                            jsonDecode(
                                                                jsonEncode(
                                                          getCartHistoryList[j],
                                                        ))));
                                              }
                                            }
                                            Get.find<CartController>()
                                                .setItems = moreOrder;
                                            Get.find<CartController>()
                                                .addToCartList();
                                            Get.toNamed(
                                                RouteHelper.getCartPage());
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: Dimensions.width10,
                                              vertical: Dimensions.height5,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius15 / 2),
                                              border: Border.all(
                                                  width: 1,
                                                  color: AppColors.mainColor),
                                            ),
                                            child: SmallText(
                                              text: "one more",
                                              color: AppColors.mainColor,
                                            ),
                                          ),
                                        )
                                      ]),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
