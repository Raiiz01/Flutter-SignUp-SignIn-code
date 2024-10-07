import 'package:flutter/material.dart';
import 'package:verifypages/Screens/homeScreen.dart';
import 'package:verifypages/Screens/verificationCode.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}