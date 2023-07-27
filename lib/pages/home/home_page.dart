import 'package:flutter/material.dart';
import 'package:food_delivery_project/pages/cart/cart_history.dart';
import 'package:food_delivery_project/pages/home/main_food_page.dart';
import 'package:food_delivery_project/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectediIndex = 0;

  List pages = [
    MainFoodPage(),
    CartHistory(),
    Container(child: Center(child: Text("page 2"))),
    Container(child: Center(child: Text("page 3"))),
  ];

  void onTapNav(int index) {
    setState(() {
      _selectediIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectediIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.amberAccent,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: _selectediIndex,
        onTap: onTapNav,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "history",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "profile",
          ),
        ],
      ),
    );
  }

  // late PersistentTabController _controller;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = PersistentTabController(initialIndex: 0);
  // }

  // List<Widget> _buildScreens() {
  //   return [
  //     MainFoodPage(),
  //     Container(child: Center(child: Text("page 1"))),
  //     Container(child: Center(child: Text("page 2"))),
  //     Container(child: Center(child: Text("page 3"))),
  //   ];
  // }

  // List<PersistentBottomNavBarItem> _navBarsItems() {
  //   return [
  //     PersistentBottomNavBarItem(
  //       icon: Icon(Icons.home),
  //       title: ("Home"),
  //       activeColorPrimary: AppColors.mainColor,
  //       inactiveColorPrimary: Colors.amberAccent,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Icon(Icons.history),
  //       title: ("History"),
  //       activeColorPrimary: AppColors.mainColor,
  //       inactiveColorPrimary: Colors.amberAccent,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Icon(Icons.shopping_cart),
  //       title: ("Cart"),
  //       activeColorPrimary: AppColors.mainColor,
  //       inactiveColorPrimary: Colors.amberAccent,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Icon(Icons.person),
  //       title: ("Profile"),
  //       activeColorPrimary: AppColors.mainColor,
  //       inactiveColorPrimary: Colors.amberAccent,
  //     ),
  //   ];
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return PersistentTabView(
  //     context,
  //     controller: _controller,
  //     screens: _buildScreens(),
  //     items: _navBarsItems(),
  //     confineInSafeArea: true,
  //     backgroundColor: Colors.white, // Default is Colors.white.
  //     handleAndroidBackButtonPress: true, // Default is true.
  //     resizeToAvoidBottomInset:
  //         true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
  //     stateManagement: true, // Default is true.
  //     hideNavigationBarWhenKeyboardShows:
  //         true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
  //     decoration: NavBarDecoration(
  //       borderRadius: BorderRadius.circular(10.0),
  //       colorBehindNavBar: Colors.white,
  //     ),
  //     popAllScreensOnTapOfSelectedTab: true,
  //     popActionScreens: PopActionScreensType.all,
  //     itemAnimationProperties: ItemAnimationProperties(
  //       // Navigation Bar's items animation properties.
  //       duration: Duration(milliseconds: 200),
  //       curve: Curves.ease,
  //     ),
  //     screenTransitionAnimation: ScreenTransitionAnimation(
  //       // Screen transition animation on change of selected tab.
  //       animateTabTransition: true,
  //       curve: Curves.ease,
  //       duration: Duration(milliseconds: 200),
  //     ),
  //     navBarStyle:
  //         NavBarStyle.style1, // Choose the nav bar style with this property.
  //   );
  // }
}
