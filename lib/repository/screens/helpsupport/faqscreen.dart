import 'package:flutter/material.dart';
import 'package:bodega_delivery/domain/constants/appcolors.dart';
import 'package:bodega_delivery/repository/widgets/uihelper.dart';
import '../profile/profilescreen.dart';
import '../home/homescreen.dart';

class FAQScreen extends StatelessWidget {
  final List<Map<String, String>> faqs = [
    {
      'question': 'What should I do if my order is late?',
      'answer':
      'If your order is delayed, please check the order status under “My Orders”. You can also contact our support team for updates.'
    },
    {
      'question': 'How do I place an order?',
      'answer':
      'Browse products, add them to your cart, and proceed to checkout. Confirm your delivery address and payment method to complete the order.'
    },
    {
      'question': 'What payment methods are accepted?',
      'answer':
      'We accept UPI, credit/debit cards, wallets, and cash on delivery depending on your location.'
    },
    {
      'question': 'Why was my payment declined?',
      'answer':
      'Payments can fail due to network issues, insufficient balance, or incorrect card details. Try again or use another payment method.'
    },
    {
      'question': 'How do I use search and filters?',
      'answer':
      'Use the search bar to find specific products. You can apply filters by category, price, and availability.'
    },
    {
      'question': 'Who delivers my order?',
      'answer':
      'Our trained delivery partners ensure safe and timely delivery to your doorstep.'
    },
    {
      'question': 'How do I rate or tip the delivery agent?',
      'answer':
      'After your order is delivered, you can rate the delivery agent and add a tip through the order summary screen.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Header
              Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: UiHelper.CustomText(
                        text: "Bodega",
                        color: AppColors.text1(context),
                        fontweight: FontWeight.bold,
                        fontsize: 20,
                        fontfamily: "bold",
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 16,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration:
                            const Duration(milliseconds: 300),
                            pageBuilder: (_, __, ___) => ProfileScreen(),
                            transitionsBuilder:
                                (_, animation, __, child) {
                              final tween = Tween(
                                begin: const Offset(-1.0, 0.0),
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
                      child: CircleAvatar(
                        backgroundColor: AppColors.profileb(context),
                        child:
                        Icon(Icons.person, color: AppColors.icon(context)),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // 🔹 Title
              Text(
                "FAQs",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text1(context),
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 FAQs List
              Expanded(
                child: ListView.builder(
                  itemCount: faqs.length,
                  itemBuilder: (context, index) {
                    final faq = faqs[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: AppColors.inputField(context),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          dividerColor: Colors.transparent,
                        ),
                        child: ExpansionTile(
                          tilePadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          collapsedShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          title: Text(
                            faq['question']!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.text(context),
                            ),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              child: Text(
                                faq['answer']!,
                                style: TextStyle(
                                  fontSize: 14,
                                  height: 1.4,
                                  color:
                                  AppColors.text(context).withOpacity(0.8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // 🔹 Back Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration:
                        const Duration(milliseconds: 400),
                        pageBuilder: (_, __, ___) => ProfileScreen(),
                        transitionsBuilder:
                            (_, animation, __, child) {
                          final tween = Tween(
                            begin: const Offset(-1.0, 0.0),
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.button(context),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
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
