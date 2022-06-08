import 'package:flutter/material.dart';
import 'package:bmi_calculator/calc_screen.dart'; //Body mass index calculator
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home:const BMI(),
    );
  }
}
