import 'package:flutter/material.dart';
import './splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Heapware',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.green,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white), // Updated from bodyText2
        ),
      ),

      home: SplashScreen(), // Start with Splash Screen
    );
  }
}
