import 'dart:async';

//import 'package:demo_application/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'quiz.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1),()
    {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
          QuizApp(),
      ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              CircleAvatar(
                backgroundImage: AssetImage("assets/splash.jpeg"),
                radius: 100,
              ),
              SizedBox(
                height: 21,
              ),
              Text('QuizApp',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}

