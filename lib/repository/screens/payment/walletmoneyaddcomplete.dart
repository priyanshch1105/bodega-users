import 'package:bodega_delivery/repository/screens/home/homescreen.dart';
import 'package:bodega_delivery/repository/screens/location/orderstatusscreen.dart';
import 'package:bodega_delivery/repository/screens/payment/paymentcompletedscreen.dart';
import 'package:bodega_delivery/repository/screens/payment/walletbalance.dart';
import 'package:flutter/material.dart';
import 'package:bodega_delivery/domain/constants/appcolors.dart'; // import AppColors

class WalletMoneyCompletedScreen extends StatelessWidget {
  const WalletMoneyCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            children: [
              // Top Title
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Bodega",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.text1(context),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // BO text
              Text(
                "BO",
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  color: AppColors.button(context), // brand color
                ),
              ),
              const SizedBox(height: 8),

              // Subtitle
              Text(
                "Money Added in Wallet",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppColors.button(context),
                ),
              ),
              const SizedBox(height: 16),

              // Amount
              Text(
                "₹500",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text(context),
                ),
              ),

              const SizedBox(height: 40),
              const Spacer(),

              // Done Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 100),
                      pageBuilder: (context, animation, secondaryAnimation) =>
                      const PaymentCompletedScreen(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(-1.0, 0.0); // Slide from left
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
                  fixedSize: const Size(370, 50),
                  backgroundColor: AppColors.button(context),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Done",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.buttontext(context),
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
