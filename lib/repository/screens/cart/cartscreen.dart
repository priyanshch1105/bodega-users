import 'package:bodega_delivery/repository/screens/location/deliverylocscreen.dart';
import 'package:flutter/material.dart';
import 'package:bodega_delivery/repository/widgets/uihelper.dart';
import '../profile/profilescreen.dart';
import 'package:bodega_delivery/domain/constants/appcolors.dart';
class CartScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
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

                  // Profile icon with gesture
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 22),
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
              Text(
                "Cart",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text1(context),
                ),
              ),
              const SizedBox(height: 20),

              // Product Card
              Container(
                decoration: BoxDecoration(
                  color: AppColors.inputField(context),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/1/15/Red_Apple.jpg",
                    width: 50,
                    height: 50,
                  ),
                  title: Text(
                    "₹299",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.text(context),
                    ),
                  ),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Organic Apples - 1 KG"),
                      Row(
                        children: [
                          Icon(Icons.star, size: 16, color: Colors.deepPurple),
                          Icon(Icons.star, size: 16, color: Colors.deepPurple),
                          Icon(Icons.star, size: 16, color: Colors.deepPurple),
                          Icon(Icons.star_border, size: 16, color: Colors.deepPurple),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(),

              // Buttons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(120, 50),
                      backgroundColor: AppColors.grey(context),
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
                        color: AppColors.text(context),
                      ),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 100),
                          pageBuilder: (context, animation, secondaryAnimation) =>
                              DeliveryLocationScreen(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
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
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(230, 50),
                      backgroundColor: AppColors.button(context),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Buy",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.buttontext(context),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
