import 'package:flutter/material.dart';
import 'package:weather_wise/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Wise',
      theme: ThemeData(
        primaryColor: Colors.blue[900], //Dark Blue
        scaffoldBackgroundColor: Colors.black, //Black
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
