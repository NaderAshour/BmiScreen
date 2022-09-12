


import 'package:flutter/material.dart';



class BMIResultScreen extends StatelessWidget {
  final int result;
  final bool isMale;
  final int age;
   String ?overview;
  String ?state;

 List <String> x =['you have to gain some weight ','you have a good rating','You have to lose some weight ' ];
 List <String> v =['under weight ','Normal','over weight ' ];

    BMIResultScreen({Key? key,
    required this.result,
    required this.age,
    required this.isMale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (result<20){
          overview=v[0];
          state=x[0];
    }
    else if(result>=20 && result <30){
      overview=v[1];
      state=x[1];
    }
    else {
      overview=v[2];
      state=x[2];
      }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Result',style: TextStyle(fontSize: 50),),
       /* leading: IconButton(icon:
        const Icon(Icons.arrow_back_ios,color: Colors.black,),
        onPressed: (){
          Navigator.pop(context);
        },
        ),*/
        automaticallyImplyLeading: false,
    ),
      body:Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children: [

            Text(overview!,

              style: const TextStyle(
                fontSize:25.0,
                fontWeight:FontWeight.bold,
              ),// TextStyle
            ),
            Text(
              '$result',
              style:const TextStyle(
                fontSize:100.0,
                fontWeight:FontWeight.bold,
              ),// TextStyle
            ),
            Text('$state'
              ,
              style:const TextStyle(
                fontSize:25.0,
                fontWeight:FontWeight.bold,
              ),// TextStyle
            ),

          ] ,
        ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[400],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        color: Colors.blue,
        child: MaterialButton(onPressed: (){

          Navigator.pop(context);
        },
          height: 50,
          child: const Text('ReCalculate',style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
