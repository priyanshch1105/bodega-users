import 'package:bodega_delivery/domain/constants/appcolors.dart';
import 'package:bodega_delivery/repository/screens/profile/profilescreen.dart';
import 'package:bodega_delivery/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';

class PastOrderScreen extends StatelessWidget {
  const PastOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> pastOrders = [
      {
        'price': '₹245',
        'status': 'Delivered',
        'statusColor': Colors.green,
        'product': 'Nescafé Classic',
        'quantity': '200g jar',
        'rating': 5,
      },
      {
        'price': '₹245',
        'status': 'Error',
        'statusColor': Colors.red,
        'product': 'Nescafé Classic',
        'quantity': '200g jar',
        'rating': 4,
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.background(context),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Header
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

                    // 🔹 Profile Icon with Slide Animation
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

                const SizedBox(height: 12),
            ...pastOrders.map((order) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: AppColors.inputField(context),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      order['price'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          order['product'],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          order['quantity'],
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                        children:List.generate(
                          5,
                              (index) => Icon(
                            Icons.star,
                            size: 16,
                            color: index < order['rating']
                                ? Colors.purple
                                : Colors.grey.shade400,
                          ),
                        ),
                        ),
                      ],
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order['status'],
                      style: TextStyle(
                        color: order['statusColor'],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            )),
            const Spacer(),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                              ProfileScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.button(context),
                      padding: EdgeInsets.symmetric(vertical: 16),
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
