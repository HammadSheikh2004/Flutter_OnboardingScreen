import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Home Screen",
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.red),
        ),
      ),
    );
  }
}
