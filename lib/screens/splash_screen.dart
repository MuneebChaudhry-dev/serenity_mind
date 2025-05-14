import 'dart:async';
import 'package:flutter/material.dart';
import '../widgets/background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // After 3 seconds, navigate to Get Started
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/get_started');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Center(
          child: Image.asset('assets/images/splash_logo.png', width: 263),
        ),
      ),
    );
  }
}
