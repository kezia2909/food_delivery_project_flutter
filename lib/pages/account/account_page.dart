import 'package:flutter/material.dart';

import 'package:food_delivery_project/base/custom_loader.dart';
import 'package:food_delivery_project/controllers/cart_controller.dart';
import 'package:food_delivery_project/controllers/user_controller.dart';
import 'package:food_delivery_project/routes/route_helper.dart';

import 'package:food_delivery_project/utils/colors.dart';
import 'package:food_delivery_project/utils/dimensions.dart';
import 'package:food_delivery_project/widgets/account_widget.dart';
import 'package:food_delivery_project/widgets/app_icon.dart';
import 'package:food_delivery_project/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
      print("user has logged in");
      print(Get.find<AuthController>().authRepo.apiClient.token);
    }
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: BigText(
            text: "Profile",
            size: 24,
            color: Colors.white,
          )),
      body: GetBuilder<UserController>(builder: (userController) {
        return _userLoggedIn
            ? (userController.isLoading
                ? Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(top: Dimensions.height20),
                    child: Column(children: [
                      AppIcon(
                        icon: Icons.person,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.iconSize20 * 3.5,
                        size: Dimensions.iconSize20 * 7.5,
                      ),
                      SizedBox(
                        height: Dimensions.height30,
                      ),
                      // name
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              AccountWidget(
                                appIcon: AppIcon(
                                  icon: Icons.person,
                                  backgroundColor: AppColors.mainColor,
                                  iconColor: Colors.white,
                                  iconSize: Dimensions.iconSize24,
                                  size: Dimensions.iconSize24 * 2,
                                ),
                                bigText: BigText(
                                    text: userController.userModel.name),
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              // phone
                              AccountWidget(
                                appIcon: AppIcon(
                                  icon: Icons.phone,
                                  backgroundColor: AppColors.yellowColor,
                                  iconColor: Colors.white,
                                  iconSize: Dimensions.iconSize24,
                                  size: Dimensions.iconSize24 * 2,
                                ),
                                bigText: BigText(
                                    text: userController.userModel.phone),
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              // email
                              AccountWidget(
                                appIcon: AppIcon(
                                  icon: Icons.email,
                                  backgroundColor: AppColors.yellowColor,
                                  iconColor: Colors.white,
                                  iconSize: Dimensions.iconSize24,
                                  size: Dimensions.iconSize24 * 2,
                                ),
                                bigText: BigText(
                                    text: userController.userModel.email),
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              // address
                              AccountWidget(
                                appIcon: AppIcon(
                                  icon: Icons.location_on,
                                  backgroundColor: AppColors.yellowColor,
                                  iconColor: Colors.white,
                                  iconSize: Dimensions.iconSize24,
                                  size: Dimensions.iconSize24 * 2,
                                ),
                                bigText: BigText(text: "melati street IV / 1"),
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              // message
                              AccountWidget(
                                appIcon: AppIcon(
                                  icon: Icons.message_outlined,
                                  backgroundColor: Colors.redAccent,
                                  iconColor: Colors.white,
                                  iconSize: Dimensions.iconSize24,
                                  size: Dimensions.iconSize24 * 2,
                                ),
                                bigText: BigText(text: "Messages"),
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (Get.find<AuthController>()
                                      .userLoggedIn()) {
                                    print("START LOGOUT");
                                    Get.find<AuthController>()
                                        .clearSharedData();
                                    Get.find<CartController>().clear();
                                    Get.find<CartController>()
                                        .clearCartHistory();
                                    Get.offNamed(RouteHelper.getSignInPage());
                                  } else {
                                    print("you already log out");
                                  }
                                },
                                child: AccountWidget(
                                  appIcon: AppIcon(
                                    icon: Icons.logout,
                                    backgroundColor: Colors.redAccent,
                                    iconColor: Colors.white,
                                    iconSize: Dimensions.iconSize24,
                                    size: Dimensions.iconSize24 * 2,
                                  ),
                                  bigText: BigText(text: "SIGN OUT"),
                                ),
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  )
                : CustomLoader())
            : Container(
                child: Center(child: Text("You must Login")),
              );
      }),
    );
  }
}
