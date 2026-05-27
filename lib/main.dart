import 'package:flutter/material.dart';
import 'package:onboarding_screen/screens/SplashScreen.dart';

void main() {
  runApp(const OnBoardingApp());
}

class OnBoardingApp extends StatelessWidget {
  const OnBoardingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
  
}





