import 'package:bodega_delivery/domain/constants/appcolors.dart';
import 'package:bodega_delivery/repository/screens/Register/otpscreen.dart';
import 'package:bodega_delivery/repository/screens/Register/welcomescreen.dart';
import 'package:bodega_delivery/repository/screens/Register/BlankPage.dart';
import 'package:flutter/material.dart';
import 'package:bodega_delivery/repository/screens/Register/otpscreen.dart';
import 'package:bodega_delivery/repository/screens/Register/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController mobileController = TextEditingController();

  bool isValidPhone(String phone) {
    final pattern = RegExp(r'^[6-9]\d{9}$');
    return pattern.hasMatch(phone.trim());
  }

  void sendOTP() {
    final mobile = mobileController.text.trim();

    if (mobile.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter your mobile number")),
      );
    } else if (!isValidPhone(mobile)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Enter a valid 10-digit mobile number starting with 6-9"),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtpScreen(mobileNumber: mobile),
        ),
      );
    }
  }

  void goToBlank() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BlankPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 600;

    return Scaffold(
      backgroundColor: AppColors.background(context),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: isWide ? 500 : double.infinity),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Get Started",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Login with your mobile number",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 32),
                  TextField(
                    controller: mobileController,
                    decoration: const InputDecoration(
                      labelText: "Mobile Number",
                      hintText: "Enter your 10-digit number",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(16),
                      counterText: "", // hides character count
                    ),
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                  ),
                  const SizedBox(height: 24),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      width: 370,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.button(context),
                        borderRadius: BorderRadius.circular(9.62),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  OtpScreen(mobileNumber: '',)),
                            );
                          },
                        child:  Text(
                          'Send OTP  > ',
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 16,
                            color: AppColors.buttontext(context),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  // Submit Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      width: 370,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(9.62),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  SignUpScreen()),
                          );
                        },
                        child:  Text(
                          'SignUp',
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 16,
                            color: AppColors.text1(context),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),


                  const SizedBox(height: 24),
                  const Text(
                    "By continuing, you agree to our Terms of Service and Privacy Policy",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Color(0xFF544F94)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}