// sign_up_page.dart
import 'package:bodega_delivery/domain/constants/appcolors.dart';
import 'package:bodega_delivery/repository/screens/Register/login_screen.dart';
import 'package:bodega_delivery/repository/screens/Register/otpscreen.dart';
import 'package:flutter/material.dart';
import 'package:bodega_delivery/repository/screens/Register/BlankPage.dart';
//import 'package:bodega/theme.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>(); // key for validation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.background(context),
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [

                Text(
                  'Get Started',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Plus Jakarta Sans',
                  ),
                ),
                Text(
                  'by creating a free account.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.5,
                    fontFamily: 'Plus Jakarta Sans',
                  ),
                ),



                const SizedBox(height: 40),

                // First Name Field
                SizedBox(
                  width:370,
                height: 50,
                child:TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "First Name",
                    labelStyle:TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) =>
                  value!.isEmpty ? 'Please enter first name' : null,
                ),
                ),
                const SizedBox(height: 10),

                // Last Name Field

                SizedBox(
                  width: 370,
                height: 50,
                child:TextFormField(
                  keyboardType: TextInputType.name,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                    labelText: "Last Name",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) =>
                  value!.isEmpty ? 'Please enter last name' : null,
                ),
                ),

                const SizedBox(height: 10),

                // Mobile Number Field
                SizedBox(
                  width:370,
                height:50,
                child:TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Mobile Number",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) =>
                  value!.isEmpty ? 'Incorrect number' : null,
                ),
                ),
                const SizedBox(height: 30),

                // Submit Button
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
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  OtpScreen(mobileNumber: '',)),
                          );
                        }
                      },
                      child:  Text(
                        'Send OTP  > ',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 15,
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
                                builder: (context) =>  LoginScreen()),
                          );
                      },
                      child:  Text(
                        'Login',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 15,
                          color: AppColors.text1(context),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          'By continuing, you agree to our Terms of Service and Privacy Policy',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 12,
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),

    );
  }
}
