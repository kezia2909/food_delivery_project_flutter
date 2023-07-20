import 'package:flutter/material.dart';
import 'package:food_delivery_project/utils/dimensions.dart';
import 'package:food_delivery_project/widgets/app_column.dart';
import 'package:food_delivery_project/widgets/app_icon.dart';
import 'package:food_delivery_project/widgets/expandable_text_widget.dart';

import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImageSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/food1.jpg"),
                ),
              ),
            ),
          ),
          // icon widgets
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back,
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                ),
              ],
            ),
          ),
          // introduction of food - expandable text widget
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImageSize - 20,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(
                    text: "Beef Galantine",
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(
                    text: "Introduce",
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                        text: "Beef Galantine, a classic French dish, stands as a shining example of culinary artistry. This exquisite creation tantalizes the senses, bringing together the finest cuts of beef, a symphony of herbs and spices, and a medley of flavorful fillings, resulting in a dish that is as visually captivating as it is delicious." +
                            "\n" +
                            "At the heart of Beef Galantine lies the star of the show - the beef. Chefs often choose premium cuts such as tenderloin or top round to create the foundation of this culinary masterpiece. The beef is then marinated with a carefully crafted combination of aromatic herbs and spices, infusing the meat with an array of captivating flavors. This step is crucial to ensuring that each bite of Beef Galantine is a delight for the taste buds." +
                            "\n" +
                            "The meticulous preparation of Beef Galantine is where the true artistry of the dish comes into play. After marinating, the beef is tenderized and expertly flattened. It is then time to create the divine filling that will elevate this dish to new heights. Chefs finely chop ingredients such as mushrooms, shallots, garlic, spinach, and aromatic herbs, carefully crafting a mixture that beautifully complements the beef. This filling becomes an essential component, contributing its unique flavors and textures to the overall experience." +
                            "\n" +
                            "With both the beef and filling prepared, the chef embarks on a precise and skillful process of rolling the components into a cylindrical shape. This technique ensures that the flavors are evenly distributed throughout the Galantine, resulting in a harmonious blend of taste in every slice. The rolling is a labor of love, and as the beef takes its final form, the dish begins to showcase its artful presentation." +
                            "\n" +
                            "Cooking Beef Galantine is a ritual in itself. The rolled beef is traditionally poached or braised, enveloped in a rich and flavorful broth. This cooking method allows the beef to absorb the essence of the surrounding ingredients, enhancing its taste and tenderness. The slow, gentle cooking process also ensures that the Galantine retains its delicate texture while allowing the flavors to meld into a symphony of taste." +
                            "\n" +
                            "When the cooking process is complete, the Galantine is carefully unveiled, revealing a stunning mosaic of colors and textures. The vibrant hues of the vegetables and herbs contrast beautifully against the succulent, perfectly cooked beef. This presentation makes Beef Galantine not only a treat for the taste buds but also an enchanting sight that invites admiration and awe." +
                            "\n" +
                            "To savor Beef Galantine at its finest, it is typically served chilled, allowing the flavors to fully develop and the dish to set. It is often accompanied by a selection of complementary sauces, each adding its own touch of magic to the culinary symphony. Whether it's a tangy mustard vinaigrette or a velvety red wine reduction, these sauces elevate the experience, accentuating the flavors and textures of the dish." +
                            "\n" +
                            "In the world of fine dining, Beef Galantine stands as a timeless symbol of culinary excellence. It is an eloquent representation of the art of French gastronomy and an unforgettable journey of flavors that will leave a lasting impression on all fortunate enough to savor its refined delights. From grand celebrations to prestigious gatherings, Beef Galantine is a culinary triumph, captivating the hearts and palates of those who experience its savory elegance.",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
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
        child: Row(
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
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                    // size: Dimensions.iconSize24,
                  ),
                  SizedBox(
                    width: Dimensions.width5,
                  ),
                  BigText(
                    text: "0",
                    // size: Dimensions.font12,
                  ),
                  SizedBox(
                    width: Dimensions.width5,
                  ),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
                    // size: Dimensions.iconSize24,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.height10,
                bottom: Dimensions.height10,
                left: Dimensions.width10,
                right: Dimensions.width10,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: AppColors.mainColor),
              child: BigText(
                text: "\$10 | Add to cart",
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
