import 'package:bmi_calculater/BmiScreen.dart';

import 'package:flutter/material.dart';

//import 'BmiScreen.dart';

void main() {
  runApp(const Bmimain());
}
class Bmimain extends StatelessWidget {
  const Bmimain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BmiScreen(),
    );
  }
}
