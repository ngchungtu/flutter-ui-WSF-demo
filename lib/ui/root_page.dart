import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/plants.dart';
// import 'package:plant_app/ui/signin_screen.dart';
import 'package:plant_app/ui/scan_page.dart';
import 'package:plant_app/ui/screens/cart.dart';
import 'package:plant_app/ui/screens/favorite.dart';
import 'package:plant_app/ui/screens/home.dart';
import 'package:plant_app/ui/screens/profile.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPage();
}

class _RootPage extends State<RootPage> {
  //declare empty array for Favorite and Cart
  List<Plant> favorites = [];
  List<Plant> myCart = [];

  int _bottomNavIndex = 0;

  //list screen (=> has been converted to page widget options)
  List<Widget> _widgetOptions() {
    return [
      const HomeScreen(),
      FavoriteScreen(
        favoritedPLants: favorites,
      ),
      CartScreen(
        addedToCartPlants: myCart,
      ),
      const ProfileScreen(),
    ];
  }

  //list icon
  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  //list page title
  List<String> title = [
    'Home',
    'Favorite',
    'Cart',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title[_bottomNavIndex],
              style: TextStyle(
                color: Constants.blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            Icon(
              Icons.notifications,
              color: Constants.blackColor,
              size: 30.0,
            ),
          ],
        ),
        //set appbar background color as same as scaffold color background
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      //body hold Pages Widgets
      body: IndexedStack(
        index: _bottomNavIndex,
        //replace the list widget to list widget function
        children: _widgetOptions(),
      ),
      //Scan button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
                child: const ScanPage(), type: PageTransitionType.bottomToTop),
          );
        },
        // ignore: sort_child_properties_last
        child: Image.asset(
          'assets/images/code-scan-two.png',
          height: 30.0,
        ),
        backgroundColor: Constants.primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //create buttom bar
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        inactiveColor: Colors.black.withOpacity(.5),
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        //ontap recieve index screen
        onTap: (index) {
          setState(() {
            //index on current screen
            _bottomNavIndex = index;

            //fetch the favorites and cart items
            final List<Plant> favoritedPLants = Plant.getFavoritedPlants();
            final List<Plant> addedToCartPlants = Plant.addedToCartPlants();

            //update the cart and the favorites
            favorites = favoritedPLants;
            myCart = addedToCartPlants.toSet().toList(); //the .toSet() will remove any duplicates in the list
          });
        },
      ),
    );
  }
}
