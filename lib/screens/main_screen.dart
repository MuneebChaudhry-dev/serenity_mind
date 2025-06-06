import 'package:flutter/material.dart';
import 'package:serenity_mind/screens/journal_screen.dart';
import 'package:serenity_mind/screens/self_care_screen.dart';
import 'package:serenity_mind/screens/talk_screen.dart';
import 'package:serenity_mind/screens/therapit_screen.dart';
import '../widgets/background.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import 'home/home_screen.dart';
// import other screens when available

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const GetTherapistScreen(), // Will be replaced with other screens
    const TalkScreen(),
    SelfCareScreen(),
    JournalScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: GradientBackground(child: _screens[_selectedIndex]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: CustomBottomNavBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
