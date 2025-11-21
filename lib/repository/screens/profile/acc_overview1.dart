import 'package:bodega_delivery/repository/screens/profile/acc_overview2.dart';
import 'package:bodega_delivery/repository/screens/profile/profilescreen.dart';
import 'package:flutter/material.dart';
import '../../widgets/uihelper.dart';
import 'package:bodega_delivery/domain/constants/appcolors.dart'; // ✅ Added AppColors import

class AccOverview1Screen extends StatelessWidget {
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
              // Top Logo + Avatar
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
                      onTap: () => Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 300),
                          pageBuilder: (_, __, ___) => ProfileScreen(),
                          transitionsBuilder: (_, animation, __, child) {
                            final tween = Tween(begin: const Offset(-1.0, 0.0), end: Offset.zero)
                                .chain(CurveTween(curve: Curves.easeInOut));
                            return SlideTransition(position: animation.drive(tween), child: child);
                          },
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: AppColors.profileb(context),
                        child: Icon(Icons.person,color: AppColors.icon(context)),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Title
              Text(
                "Account Overview",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text1(context),
                ),
              ),

              const SizedBox(height: 20),

              // Camera icon
              Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.camera_alt,
                      size: 50, color: Color(0XFF59578F)),
                ),
              ),

              const SizedBox(height: 20),

              // Name field
              TextField(
                decoration: InputDecoration(
                  hintText: "Name",
                  filled: true,
                  fillColor: AppColors.inputField(context),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Mobile number + verifying button
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "Mobile Number",
                        filled: true,
                        fillColor: AppColors.inputField(context),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) =>
                                AccOverview2Screen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.verifyProfileLight,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text("Verifying"),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Email field
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "E-Mail(Optional)",
                  filled: true,
                  fillColor: AppColors.inputField(context),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // OTP field
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "OTP",
                  filled: true,
                  fillColor: AppColors.inputField(context),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Verify button
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
                    "Verify",
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
