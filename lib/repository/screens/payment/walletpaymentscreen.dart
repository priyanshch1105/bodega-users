import 'package:bodega_delivery/repository/screens/payment/bodegawalletscreen.dart';
import 'package:bodega_delivery/repository/screens/payment/linkedpaymentscreen.dart';
import 'package:bodega_delivery/repository/screens/profile/profilescreen.dart';
import 'package:flutter/material.dart';

import '../../widgets/uihelper.dart';
import 'package:bodega_delivery/domain/constants/appcolors.dart'; // import AppColors

class WalletPaymentScreen extends StatelessWidget {
  final List<String> options = [
    "Linked Payments(UPI,Cards,COD)",
    "BOdega Wallet balance",
  ];

  final List<Widget> screens = [
    LinkedPaymentScreen(),
    BOdegaWalletScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 300),
                          pageBuilder: (context, animation, secondaryAnimation) =>
                              ProfileScreen(),
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
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 22),
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: AppColors.profileb(context),
                        child: Icon(Icons.person, color: AppColors.icon(context)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // User Profile Title
              Text(
                "Wallet & Payments",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text1(context),
                ),
              ),
              const SizedBox(height: 20),

              // Expanded List of Options
              Expanded(
                child: ListView.builder(
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => screens[index],
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 16),
                          decoration: BoxDecoration(
                            color: AppColors.inputField(context),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            options[index],
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.text(context),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Back Button at Bottom
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.button(context),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Back",
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.buttontext(context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
