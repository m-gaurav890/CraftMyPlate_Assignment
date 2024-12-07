import 'package:craft_my_plate_assignment/Home.dart';
import 'package:craft_my_plate_assignment/breakfastMenuScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Assignmeent',
      home: HomeScreen(),
    );
  }
}
