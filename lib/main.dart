import 'package:calculator/SplashScreen.dart';
import 'package:flutter/material.dart';

import 'Screens/Homepage.dart';

void main (){
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      home: Splashscreen(),
    );
  }
}

