import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather_wise/screens/home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Variables
  double logoOpacity = 0.0;
  double logoNameOpacity = 0.0;
  double headlineOpacity = 0.0;

  @override
  // Functions
  void initState() {
    super.initState();
    // TODO: implement initState
    Timer(const Duration(seconds: 1), () {
      setState(() {
        logoOpacity = 1.0;
      });
    });
    Timer(const Duration(seconds: 2), () {
      setState(() {
        logoNameOpacity = 1.0;
      });
    });
    Timer(const Duration(seconds: 3), () {
      setState(() {
        headlineOpacity = 1.0;
      });
      Timer(const Duration(seconds: 6), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) {
          return const HomeScreen();
        }));
      });
    });
  }

  // Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1A2373), Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 200.0,),
              AnimatedOpacity(
                opacity: logoOpacity,
                duration: const Duration(seconds: 2),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 75.0
                  ),
                  child: Image.asset('assets/images/logo_w.png'),
                ),
              ),
              const SizedBox(height: 30.0,),
              AnimatedOpacity(
                opacity: logoNameOpacity,
                duration: const Duration(seconds: 2),
                child: const Padding(padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                  child: Text('Weather Wise',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 250.0,),
              AnimatedOpacity(
                opacity: headlineOpacity,
                duration: const Duration(seconds: 2),
                child: Text('Sunrise to Sunset, Weather Speaks.',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ),
              const SizedBox(height: 10.0,),
            ],
          ),
        ),
      ),
    );
  }
}