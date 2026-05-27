import 'dart:async';
import 'package:flutter/material.dart';
import 'package:onboarding_screen/intro_screen/OnBordingScreen.dart';
import 'package:onboarding_screen/screens/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
 void initState(){
   super.initState();
   navigate();
 }

 Future<void> navigate() async{
    await Future.delayed(Duration(seconds: 3));
    final pref = await SharedPreferences.getInstance();
    bool seen = pref.getBool("seenOnboarding") ?? false;
    if(!mounted) return;
    if(seen){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Homescreen()),
      );
    }else{
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => OnBoardingScreen()),
      );
    }
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