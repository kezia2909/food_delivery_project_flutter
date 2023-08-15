import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_project/pages/auth/sign_up_page.dart';
import 'package:food_delivery_project/utils/colors.dart';
import 'package:food_delivery_project/utils/dimensions.dart';
import 'package:food_delivery_project/widgets/app_text_field.dart';
import 'package:food_delivery_project/widgets/big_text.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          SizedBox(
            height: Dimensions.screenHeight * 0.09,
          ),
          Container(
            child: Center(
              child: CircleAvatar(
                  radius: Dimensions.radius20 * 4,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/image/logo.png")),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: Dimensions.width20, top: Dimensions.width15),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello",
                  style: TextStyle(
                      fontSize: Dimensions.font20 * 3,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Sign into your account",
                  style: TextStyle(
                    fontSize: Dimensions.font20,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.height15,
          ),
          AppTextField(
            textController: emailController,
            hintText: "email",
            icon: Icons.email,
          ),
          SizedBox(
            height: Dimensions.height5,
          ),
          AppTextField(
            textController: passwordController,
            hintText: "password",
            icon: Icons.password,
          ),
          SizedBox(
            height: Dimensions.height30 * 1.5,
          ),
          Container(
            width: Dimensions.screenWidth / 2,
            height: Dimensions.screenHeight / 14,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: AppColors.mainColor),
            child: Center(
              child: BigText(
                text: "SIGN IN",
                size: Dimensions.font26,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height30 * 3,
          ),
          RichText(
            text: TextSpan(
              text: "Don't have an account? ",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: Dimensions.font20,
              ),
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () =>
                        Get.to(() => SignUpPage(), transition: Transition.fade),
                  text: "Create",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: Dimensions.font20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
