import 'package:bodega_delivery/repository/screens/personalpref/langselectscreen.dart';
import 'package:bodega_delivery/repository/screens/personalpref/notificationscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bodega_delivery/repository/widgets/uihelper.dart';
import 'package:bodega_delivery/repository/screens/profile/profilescreen.dart';
import 'package:bodega_delivery/theme_provider.dart';
import 'package:bodega_delivery/domain/constants/appcolors.dart';

class PersonalPrefScreen extends StatelessWidget {
  PersonalPrefScreen({super.key});

  final List<String> options = [
    "Notification Setting",
    "Language Selection",
  ];

  final List<Widget> screens = [
    NotificationScreen(),
    LangSelectScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      backgroundColor: AppColors.background(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section
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
                    left: 10,
                    top: 16,
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration:
                          const Duration(milliseconds: 300),
                          pageBuilder: (_, __, ___) => ProfileScreen(),
                          transitionsBuilder: (_, animation, __, child) {
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
                      ),
                      child: CircleAvatar(
                        backgroundColor: AppColors.profileb(context),
                        child: Icon(Icons.person, color: AppColors.icon(context)),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),
              Text(
                "Personal Preferences",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text1(context),
                ),
              ),
              const SizedBox(height: 20),

              // Option containers
              ...List.generate(
                options.length,
                    (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
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
                ),
              ),

              // Dark / Light Mode toggle (same style & spacing)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: double.infinity,
                  padding:
                  const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  decoration: BoxDecoration(
                    color: AppColors.inputField(context),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Dark / Light Mode",
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.text(context),
                        ),
                      ),
                      Switch(
                        value: isDarkMode,
                        onChanged: (val) => themeProvider.toggleTheme(val),
                        activeColor: AppColors.button(context),
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(),

              // Back Button
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
                      color: AppColors.buttontext(context),
                      fontWeight: FontWeight.w600,
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
