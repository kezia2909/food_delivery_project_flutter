import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_project/pages/auth/sign_in_page.dart';
import 'package:food_delivery_project/utils/colors.dart';
import 'package:food_delivery_project/utils/dimensions.dart';
import 'package:food_delivery_project/widgets/app_text_field.dart';
import 'package:food_delivery_project/widgets/big_text.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = [
      "google.png",
      "facebook.png",
      "twitter.png",
    ];

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
            height: Dimensions.height5,
          ),
          AppTextField(
            textController: nameController,
            hintText: "name",
            icon: Icons.person,
          ),
          SizedBox(
            height: Dimensions.height5,
          ),
          AppTextField(
            textController: phoneController,
            hintText: "phone",
            icon: Icons.phone,
          ),
          SizedBox(
            height: Dimensions.height30,
          ),
          Container(
            width: Dimensions.screenWidth / 2,
            height: Dimensions.screenHeight / 14,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: AppColors.mainColor),
            child: Center(
              child: BigText(
                text: "SIGN UP",
                size: Dimensions.font26,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          RichText(
            text: TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () =>
                    Get.to(() => SignInPage(), transition: Transition.fade),
              text: "Have an account already?",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: Dimensions.font20,
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height30,
          ),
          RichText(
            text: TextSpan(
              text: "Sign up using one of the following methods",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: Dimensions.font16,
              ),
            ),
          ),
          Wrap(
            children: List.generate(
              3,
              (index) => Padding(
                padding: EdgeInsets.all(Dimensions.width10),
                child: CircleAvatar(
                  radius: Dimensions.radius30,
                  backgroundColor: Colors.white,
                  backgroundImage:
                      AssetImage("assets/image/" + signUpImages[index]),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
