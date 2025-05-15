import 'package:flutter/material.dart';
import 'package:serenity_mind/before_begin.dart';
import 'package:serenity_mind/screens/personal_info_screen.dart';
import 'package:serenity_mind/screens/suffering_from.dart';
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
        '/': (_) => const SplashScreen(),
        '/get_started': (_) => const GetStartedScreen(),
        '/personal_info': (_) => const PersonalInfoScreen(),
        '/suffering_from': (_) => const SufferingFromScreen(),
        '/before_begin': (_) => const BeforeBeginScreen(),
        // … other routes
      },
    );
  }
}
