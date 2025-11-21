import 'package:bodega_delivery/domain/constants/appcolors.dart';
import 'package:bodega_delivery/repository/screens/profile/profilescreen.dart';
import 'package:bodega_delivery/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';

class CustomerChatScreen extends StatelessWidget {
  const CustomerChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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


            Text(
              "Customer Support Chat",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.text1(context),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "New conversation started with the customer support",
              style: TextStyle(
                fontSize: 14,
                color: AppColors.text(context),
              ),
            ),
            const SizedBox(height: 20),

            // Chat messages
            Expanded(
              child: ListView(
                children: [
                  _buildChatBubble(
                    text: "Hi, How can I help you ?",
                    isUser: false,
                    context: context,
                  ),
                  _buildChatBubble(
                    text: "How many devices does BOdega Support",
                    isUser: true,
                    context: context,
                  ),
                  _buildChatBubble(
                    text:
                    "BOdega Support’s almost every mobile Device which runs android Version 4 or Higher",
                    isUser: false,
                    context: context,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Floating back button
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.button(context),
        onPressed: () => Navigator.pop(context),
        child:Icon(Icons.arrow_back, color:AppColors.buttontext(context) ),
      ),
    );
  }

  Widget _buildChatBubble({
    required String text,
    required bool isUser,
    required BuildContext context,
  }) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.card(context),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft: Radius.circular(isUser ? 12 : 0),
            bottomRight: Radius.circular(isUser ? 0 : 12),
          ),
        ),
        constraints: const BoxConstraints(maxWidth: 280),
        child: Text(
          text,
          style: TextStyle(fontSize: 15, color: AppColors.text(context)),
        ),
      ),
    );
  }
}
