import 'package:bodega_delivery/repository/screens/bottomnav/bottomnavscreen.dart';
import 'package:bodega_delivery/repository/screens/home/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:bodega_delivery/repository/screens/Order/orderhistoryreorderscreen.dart';
import 'package:bodega_delivery/repository/screens/payment/walletpaymentscreen.dart';
import 'package:bodega_delivery/domain/constants/appcolors.dart';
import '../../widgets/uihelper.dart';
import '../cart/cartscreen.dart';
import '../helpsupport/helpsupportscreen.dart';
import '../location/deliveryadd.dart';
import '../payment/payment.dart';
import '../personalpref/personalprefscreen.dart';
import 'acc_overview.dart';

class ProfileScreen extends StatelessWidget {
  final List<String> options = [
    "Account Overview",
    "Delivery Address",
    "Order History & Reorders",
    "Wallet & Payments",
    "Help & Support",
    "Personal Preferences",
  ];

  final List<Widget> screens = [
    AccOverviewScreen(),
    DeliveryAddScreen(),
    OrderHistoryReorderScreen(),
    WalletPaymentScreen(),
    HelpSupportScreen(),
    PersonalPrefScreen(),
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
              // Header section with avatar and title
              Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: UiHelper.CustomText(
                        text: "BOdega",
                        color: AppColors.text1(context),
                        fontweight: FontWeight.bold,
                        fontsize: 20,
                        fontfamily: "bold",
                      ),
                    ),
                  ),
                  Positioned(
                    left: 15,
                    top: 16,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        backgroundColor: AppColors.profileb(context),
                        child: Icon(
                          Icons.person,
                          color: AppColors.icon(context),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              Text(
                "User Profile",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text1(context),
                ),
              ),
              const SizedBox(height: 20),

              // Profile Options
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
                            PageRouteBuilder(
                              transitionDuration:
                              const Duration(milliseconds: 400),
                              pageBuilder: (_, __, ___) => screens[index],
                              transitionsBuilder:
                                  (_, animation, __, child) {
                                final tween = Tween(
                                  begin: const Offset(1.0, 0.0),
                                  end: Offset.zero,
                                ).chain(CurveTween(curve: Curves.easeInOut));
                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                );
                              },
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

              const SizedBox(height: 10),

              // ✅ Back Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 100),
                        pageBuilder: (_, __, ___) => BottomNavScreen(),
                        transitionsBuilder: (_, animation, __, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                    },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.button(context),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    "Back",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
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
