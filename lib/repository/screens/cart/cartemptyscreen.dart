import 'package:bodega_delivery/repository/screens/location/deliverylocscreen.dart';
import 'package:flutter/material.dart';
import 'package:bodega_delivery/repository/widgets/uihelper.dart';
import '../profile/profilescreen.dart';
import 'package:bodega_delivery/domain/constants/appcolors.dart';

class CartEmptyScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background(context),
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            Stack(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 30),
                    Center(
                      child: UiHelper.CustomText(
                        text: "BOdega",
                        color: AppColors.text1(context),
                        fontweight: FontWeight.bold,
                        fontsize: 20,
                        fontfamily: "bold",
                      ),
                    ),
                  ],
                ),

                // Profile icon
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 300),
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            ProfileScreen(),
                        transitionsBuilder: (context, animation,
                            secondaryAnimation, child) {
                          const begin = Offset(-1.0, 0.0);
                          const end = Offset.zero;
                          final tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: Curves.easeInOut));
                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 22),
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: AppColors.profileb(context),
                      child: Icon(Icons.person, color: AppColors.icon(context)),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 22),
              child:Text(
              "Cart",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.text1(context),
              ),
            ),
            ),

            const SizedBox(height: 40),

            // Empty Cart Image
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/cartempty.png',
                      height: 250,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ),

            // Centered Back Button at Bottom
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(370, 50),
                    backgroundColor: AppColors.button(context),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Back",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.buttontext(context),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
