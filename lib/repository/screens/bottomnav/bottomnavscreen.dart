import 'package:bodega_delivery/repository/screens/cart/cartemptyscreen.dart';
import 'package:bodega_delivery/repository/screens/category/categoryscreen.dart';
import 'package:bodega_delivery/repository/screens/home/homescreen.dart';
import 'package:flutter/material.dart';
import '../BOassistant/boassistant.dart';
import '../vendors/vendorscreen.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  final List<Widget> pages = [
    HomeScreen(),
    CategoryScreen(),
    BoAssistantScreen(),
    VendorScreen(),
    CartEmptyScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: IndexedStack(
          key: ValueKey<int>(currentIndex),
          index: currentIndex,
          children: pages,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/home.png",
              color: currentIndex == 0 ? Colors.black : null,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/prodctlist.png",
              color: currentIndex == 1 ? Colors.black : null,
            ),
            label: "Product",
          ),
          BottomNavigationBarItem(
            icon: Transform.translate(
              offset: Offset(0, -20),
              child: Image.asset(
                "assets/images/boassistant.png",
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/vendor.png",
              color: currentIndex == 3 ? Colors.black : null,
            ),
            label: "Vendor",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/cart.png",
              color: currentIndex == 4 ? Colors.black : null,
            ),
            label: "Cart",
          ),
        ],
      ),
    );
  }
}
