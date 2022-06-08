import 'package:flutter/material.dart';
class Second extends StatelessWidget {
  final bool gender;
  final int age;
  final int result;
  const Second({Key? key, required this.gender, required this.age, required this.result}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("BMI CALCULATOR"),centerTitle:true,),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("GENDER: ${gender?'Male':'Female'}",style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          const SizedBox(height: 40,),
          Text("AGE: $age",style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          const SizedBox(height: 40,),
          Text("RESULT: $result",style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        ],
      ),),
    );
  }
}
