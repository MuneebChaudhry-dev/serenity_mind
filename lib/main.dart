import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/get_started_screen.dart';
// import 'screens/onboarding_screen.dart'; // your next step

void main() {
  runApp(const SerenityMindApp());
}

class SerenityMindApp extends StatelessWidget {
  const SerenityMindApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serenity Mind',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/get_started': (context) => const GetStartedScreen(),
        // '/onboarding':
        //     (context) => const OnboardingScreen(), // implement this next
      },
    );
  }
}
