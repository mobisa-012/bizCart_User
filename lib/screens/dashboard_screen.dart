import 'package:bizcart/screens/dashboard/cart_screen.dart';
import 'package:bizcart/screens/dashboard/home_screen.dart';
import 'package:bizcart/screens/dashboard/my_profile_screen.dart';
import 'package:bizcart/screens/dashboard/wish_list_screen.dart';
import 'package:bizcart/screens/dashboard/order_screen.dart';
import 'package:bizcart/utils/colors.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: CustomColor.primaryColor,
        selectedIndex: currentIndex,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          currentIndex = index;
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        }),
        items: [
          BottomNavyBarItem(
            icon: SvgPicture.asset(
                'assets/svg/home.svg',
              color: Colors.white.withOpacity(0.8),
            ),
            title: Text(
                'Home',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            activeColor: Colors.white.withOpacity(0.1),
          ),
          BottomNavyBarItem(
            icon: SvgPicture.asset(
              'assets/svg/document.svg',
              color: Colors.white,
            ),
            title: Text(
              'Order',
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            activeColor: Colors.white.withOpacity(0.1),
          ),
          BottomNavyBarItem(
            icon: SvgPicture.asset(
              'assets/svg/bag.svg',
              color: Colors.white,
            ),
            title: Text(
              'Cart',
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            activeColor: Colors.white.withOpacity(0.1),
          ),
          BottomNavyBarItem(
            icon: SvgPicture.asset(
              'assets/svg/heart.svg',
              color: Colors.white,
            ),
            title: Text(
              'Saved',
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            activeColor: Colors.white.withOpacity(0.1),
          ),
          BottomNavyBarItem(
            icon: SvgPicture.asset(
              'assets/svg/profile.svg',
              color: Colors.white,
            ),
            title: Text(
              'Profile',
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            activeColor: Colors.white.withOpacity(0.1),
          ),

        ],
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => currentIndex = index);
          },
          children: <Widget>[
            HomeScreen(),
            OrderScreen(),
            CartScreen(),
            WishListScreen(),
            MyProfileScreen()
          ],
        ),
      ),
    );
  }
}
