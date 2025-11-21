import 'package:bodega_delivery/repository/screens/profile/profilescreen.dart';
import 'package:bodega_delivery/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:bodega_delivery/domain/constants/appcolors.dart'; // Import AppColors

class LinkedPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                      child:  Icon(Icons.person, color: AppColors.icon(context)),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
            Text(
              "Linked payments",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.text1(context),
              ),
            ),
            const SizedBox(height: 20),

            // Payment Method 1
            GestureDetector(
              onTap: () {},
              child: _buildPaymentCard(
                context,
                title: "Bodega",
                subtitle: "1234567890@ybl\nPhonepe",
                status: "Connected",
              ),
            ),

            // Payment Method 2
            GestureDetector(
              onTap: () {},
              child: _buildPaymentCard(
                context,
                title: "Bodega Debit Card",
                subtitle: "XXXX XXXX 2025\nABC Bank",
                status: "Connected",
              ),
            ),

            // Add New Method
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: AppColors.inputField(context),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Add New Method",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.text(context),
                  ),
                ),
              ),
            ),

            const Spacer(),

            // Back Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.button(context),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Back",
                  style: TextStyle(fontSize: 18,
                    color: AppColors.buttontext(context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentCard(
      BuildContext context, {
        required String title,
        required String subtitle,
        required String status,
      }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.inputField(context),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text(context),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.text(context),
                  ),
                ),
              ],
            ),
          ),
          Text(
            status,
            style: const TextStyle(fontSize: 14, color: Colors.green),
          ),
        ],
      ),
    );
  }
}
