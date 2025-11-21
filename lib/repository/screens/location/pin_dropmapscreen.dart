import 'dart:async';
import 'package:bodega_delivery/domain/constants/appcolors.dart';
import 'package:bodega_delivery/repository/screens/profile/profilescreen.dart';
import 'package:flutter/material.dart';
import '../../widgets/uihelper.dart';


class Pin_dropMapScreen extends StatefulWidget {
  @override
  _Pin_dropMapScreenState createState() => _Pin_dropMapScreenState();
}

class _Pin_dropMapScreenState extends State<Pin_dropMapScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background(context),
      body: SafeArea(
        child: Column(
          children: [
            // ✅ Top Logo + Avatar
            Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: 30),
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
                        transitionDuration: Duration(milliseconds: 300),
                        pageBuilder: (context, animation, secondaryAnimation) => ProfileScreen(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          const begin = Offset(-1.0, 0.0); // From right
                          const end = Offset.zero;
                          final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeInOut));
                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child:Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 22),

                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: AppColors.profileb(context),
                      child: Icon(Icons.person, color: AppColors.icon(context)),
                    ),
                  ),
                ),
              ],
            ),

            // ✅ Main Map + Overlays
            Expanded(
              child: Stack(
                children: [
                  // Map Image
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/demomap1.png",
                      fit: BoxFit.cover,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 3, // optional subtle shadow
                      ),
                      onPressed: () {
                        // TODO: Add your location pin action here
                      },
                      child: const Text(
                        'Location Pin',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  // Delivery Status Bar
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),

                        child:SizedBox(
                        width: 370,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: const Duration(milliseconds: 100),
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
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0XFF221662),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            "Back",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                    ),
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
