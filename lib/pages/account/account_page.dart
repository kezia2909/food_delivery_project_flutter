import 'package:flutter/material.dart';
import 'package:food_delivery_project/utils/colors.dart';
import 'package:food_delivery_project/utils/dimensions.dart';
import 'package:food_delivery_project/widgets/account_widget.dart';
import 'package:food_delivery_project/widgets/app_icon.dart';
import 'package:food_delivery_project/widgets/big_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: BigText(
            text: "Profile",
            size: 24,
            color: Colors.white,
          )),
      body: Container(
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
                    bigText: BigText(text: "Kezia"),
                  ),
                  SizedBox(
                    height: Dimensions.height20,
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
                    bigText: BigText(text: "0812 3456 7890"),
                  ),
                  SizedBox(
                    height: Dimensions.height20,
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
                    bigText: BigText(text: "kezia@gmail.com"),
                  ),
                  SizedBox(
                    height: Dimensions.height20,
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
                    height: Dimensions.height20,
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
                    bigText: BigText(text: "Kezia"),
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  AccountWidget(
                    appIcon: AppIcon(
                      icon: Icons.message_outlined,
                      backgroundColor: Colors.redAccent,
                      iconColor: Colors.white,
                      iconSize: Dimensions.iconSize24,
                      size: Dimensions.iconSize24 * 2,
                    ),
                    bigText: BigText(text: "Kezia"),
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  AccountWidget(
                    appIcon: AppIcon(
                      icon: Icons.message_outlined,
                      backgroundColor: Colors.redAccent,
                      iconColor: Colors.white,
                      iconSize: Dimensions.iconSize24,
                      size: Dimensions.iconSize24 * 2,
                    ),
                    bigText: BigText(text: "Kezia"),
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  AccountWidget(
                    appIcon: AppIcon(
                      icon: Icons.message_outlined,
                      backgroundColor: Colors.redAccent,
                      iconColor: Colors.white,
                      iconSize: Dimensions.iconSize24,
                      size: Dimensions.iconSize24 * 2,
                    ),
                    bigText: BigText(text: "Kezia"),
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
