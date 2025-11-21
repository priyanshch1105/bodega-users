
import 'package:bodega_delivery/domain/constants/appcolors.dart';
import 'package:bodega_delivery/repository/screens/profile/profilescreen.dart';
import 'package:flutter/material.dart';

import '../../widgets/uihelper.dart';

class ProblemReportScreen extends StatelessWidget{

  final List<String> options = [
    "Problem Statement",
    "Describe your problem(Can Describe in your /nOwn Language - BOdega Support's Multiple /nLanguages)",
    "Add image for proof(Can add Multiple pics)"
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

              SizedBox(height: 30),
              Text(
                "Report",
                style: TextStyle(
                  fontSize: 26,
                  color: AppColors.text1(context),
                  fontWeight: FontWeight.bold,
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
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 16),
                          decoration: BoxDecoration(
                            color: AppColors.inputField(context),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            options[index],
                            style: TextStyle(fontSize: 18,
                              color: AppColors.text(context),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 80,
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
                        backgroundColor: AppColors.grey(context),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Back",
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.text(context),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 270,
                    child: ElevatedButton(
                      onPressed: () {

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.button(context),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Report",
                        style: TextStyle(fontSize: 18, color: AppColors.buttontext(context)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}