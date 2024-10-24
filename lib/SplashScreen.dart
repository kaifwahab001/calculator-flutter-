import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:calculator/Screens/Homepage.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.black,
      splash: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 200,
            ),
            SizedBox(height: 40,),
              Text("Calculator",style: TextStyle(fontSize: 40,color: Colors.white),)
          ],
        ),
      ),
      splashIconSize: 300,
      nextScreen: Homepage(),
    );
  }
}
