import 'package:flutter/material.dart';
import 'package:web_view/bottom_nav_bar.dart';
import 'package:web_view/screens/splash_screen.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  Future <void> refresh(){
    return Future.delayed(Duration(seconds: 0));
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:
        MyApp(),
        //SplashScreen(),
      ),


      //SplashScreen(),
    );
  }
}
