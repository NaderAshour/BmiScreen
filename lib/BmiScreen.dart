
import 'dart:math';

import 'package:bmi_calculater/bmi_result_Screen.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale=true;
  double height =120.0;
  int weight=40;
  int age=20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),

      ),
      body:
      Column(
        children: [
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

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                        Image(image: AssetImage('assets/images/pngwing.com.png'),
                        width: 90,
                        height: 90,
                        ),
                         SizedBox(height: 20,),
                         Text('Male',style: TextStyle(fontSize: 25,
                              fontWeight: FontWeight.bold),),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: isMale? Colors.blue:Colors.grey[400],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20,),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        isMale=false;
                      });
                    },
                    child: Container(

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Image(image: AssetImage('assets/images/pngwing.com (1).png'),
                          width: 90,
                            height: 90,
                          ),
                          SizedBox(height: 20,),
                          Text('Female',style: TextStyle(fontSize: 25,
                              fontWeight: FontWeight.bold),),

                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:isMale? Colors.grey[400]:Colors.blue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ),
          ),
          Expanded(
            child:Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                   const Text('Height',style: TextStyle(fontSize: 25,
                        fontWeight: FontWeight.bold),),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${height.round()}',style: TextStyle(fontSize: 40,
                            fontWeight: FontWeight.w900)),
                        const Text('cm',style: TextStyle(fontSize: 20,
                            fontWeight: FontWeight.bold)),
                      ],
                    ),

                  Slider(
                        value: height,
                        max: 220,
                        min: 80,
                        onChanged: (value){
                          setState(() {
                            height=value;
                          });
                        }
                        ),
                  ],
                ),
                decoration:    BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
          Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Age',style: TextStyle(fontSize: 25,
                                  fontWeight: FontWeight.bold),
                              ),
                               Text('$age',style: TextStyle(fontSize: 40,
                                  fontWeight: FontWeight.w900)
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(onPressed: (){
                                    setState(() {
                                      age++;
                                    });
                                    },
                                    heroTag: 'age+',

                                      child:const Icon(Icons.add),
                                    mini: true,
                                  ),
                                  FloatingActionButton(onPressed: (){
                                    setState(() {
                                      age--;
                                    });
                                  },
                                      heroTag: 'age-',
                                    child:const Icon(Icons.remove),
                                    mini: true,

                                  ),

                                ]
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                             color: Colors.grey[400],
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Expanded(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Weight',style: TextStyle(fontSize: 25,
                                  fontWeight: FontWeight.bold),
                              ),
                                    Text('$weight',style: TextStyle(fontSize: 40,
                                  fontWeight: FontWeight.w900)
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(onPressed: (){
                                    setState(() {
                                      weight++;
                                    });
                                  },
                            heroTag: 'weight+',
                                      child:const Icon(Icons.add),
                                    mini: true,
                                  ),
                                  FloatingActionButton(onPressed: (){
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                    heroTag: 'weight--',
                                    child:const Icon(Icons.remove),
                                    mini: true,

                                  ),

                                ]
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                             color: Colors.grey[400],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ),
          Container(
            width: double.infinity,
            color: Colors.blue,
            child: MaterialButton(onPressed: (){
              double result=weight/pow(height/100,2);
              print(result.round());
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>BMIResultScreen(age: age,isMale: isMale,result: result.round(),),
                  ),
              );
            },
              height: 50,
              child: const Text('Calculate',style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}
