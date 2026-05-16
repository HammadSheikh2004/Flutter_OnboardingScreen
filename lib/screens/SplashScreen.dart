import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onboarding_screen/intro_screen/OnBordingScreen.dart';
import 'package:onboarding_screen/screens/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
 void initState(){
   Timer(Duration(seconds: 3), (){
     Navigator.pushReplacement(
       context,
       MaterialPageRoute(builder: (context) => OnBoardingScreen()),
     );
   });
   super.initState();
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Welcome",
          style: TextStyle(fontSize: 50, color: Colors.yellow, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}