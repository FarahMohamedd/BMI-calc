import 'dart:math';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/result_screen.dart';
class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);
  @override
  State<BMI> createState() => _BMIState();
}
class _BMIState extends State<BMI> {
  bool isMale=false;
  double height=120;
  int weight=50;
  int age=20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("BMI CALCULATOR"),centerTitle:true,),
      body: Column(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale=true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(9.0),
                            color:isMale?Colors.lightBlueAccent: Colors.grey[800]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:const[
                             Image(image:AssetImage("images/m.png",),width: 80,height: 80,),
                             SizedBox(height: 10,),
                            Text(("MALE"),style: TextStyle(fontSize: 20,),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child:
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isMale=false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(9.0),
                          color:isMale? Colors.grey[800]:Colors.pinkAccent),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:const[
                          Image(image: AssetImage("images/fe.jpg",),width: 80,height: 80,),
                          SizedBox(height: 10,),
                          Text(("FEMALE"),style: TextStyle(fontSize: 20,),)
                        ],
                      ),
                    ),
                  ),
                  )
                ],
              ),
            ),
          ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
    horizontal: 20.0,
    ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      const Text("Height",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w300)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text("${height.round()}",style: const TextStyle(fontSize: 40,fontWeight: FontWeight.w900)),
                          const Text("cm",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Slider(
                        activeColor:isMale?Colors.lightBlueAccent: Colors.pinkAccent,
                         value: height,
                          max: 220.0,
                          min: 80.0,
                          onChanged:(value){
                        setState(() {
                          height=value;
                        });
                          }
                      )
                    ],),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(9.0),color: Colors.grey[800]),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(9.0),color: Colors.grey[800]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        const Text("weight",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w300)),
                        Text("$weight",style: const TextStyle(fontSize: 40,fontWeight: FontWeight.w900)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(onPressed: (){
                              setState(() {
                                weight--;
                              });
                            },
                              heroTag: 'weight -',
                              backgroundColor: Colors.grey[600],
                              mini: true,
                              child: const Icon(
                              Icons.remove,
                              ),
                            ),
                            FloatingActionButton(onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },
                              heroTag: 'weight +',
                              backgroundColor: Colors.grey[600],
                              mini: true,
                              child: const Icon(
                                Icons.add,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20,),
                Expanded(
                  child:
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(9.0),color: Colors.grey[800]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        const Text("AGE",style:TextStyle(fontSize: 25,fontWeight: FontWeight.w300)),
                        Text("$age",style: const TextStyle(fontSize: 40,fontWeight: FontWeight.w900)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(onPressed: (){
                              setState(() {
                                age--;
                              });
                            },
                              heroTag: 'age -',
                              backgroundColor: Colors.grey[600],
                              mini: true,
                              child: const Icon(
                                Icons.remove,
                              ),
                            ),
                            FloatingActionButton(onPressed: (){
                              setState(() {
                                age++;
                              });
                            },
                              heroTag: 'age +',
                              backgroundColor: Colors.grey[600],
                              mini: true,
                              child: const Icon(
                                Icons.add,
                              ),
                            )
                          ],
                        )

                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      SizedBox(
        width: double.infinity,
        height: 80,
          child: MaterialButton(onPressed: (){
            double result=weight/pow(height/100,2);
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>Second(
                  gender: isMale,
                  age: age,
                  result: result.round(),
                ),
                ),
            );
          },
            color:isMale?Colors.lightBlueAccent: Colors.pinkAccent,
            child: const Text("CALCULATE",
              style: TextStyle(color: Colors.white,fontSize: 22),),
          ),

      )
      ],
      ),
    );
  }
}
