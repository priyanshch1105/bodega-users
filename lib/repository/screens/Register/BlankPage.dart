import 'dart:async';

import 'package:bodega_delivery/repository/screens/Register/welcomescreen.dart';
import 'package:flutter/material.dart';

  class BlankPage extends StatefulWidget{
  @override
  State<BlankPage> createState() => _BlankPageState();
  }

  class _BlankPageState extends State<BlankPage> {
  @override
  void initState() {
  super.initState();
  Timer(Duration(seconds: 2),(){
  Navigator.pushReplacement(
  context,
  PageRouteBuilder(
  transitionDuration: Duration(milliseconds: 100),
  pageBuilder: (_, __, ___) => WelcomeScreen(),
  transitionsBuilder: (_, animation, __, child) {
  const begin = Offset(1.0, 0.0); // Start from right
  const end = Offset.zero;
  const curve = Curves.easeOut;

  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  return SlideTransition(position: animation.drive(tween), child: child);
  },
  ),
  );
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

    );
  }
}