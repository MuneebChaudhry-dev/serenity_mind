import 'package:flutter/material.dart';
import '../../widgets/background.dart';
import 'home_top_bar.dart';
import 'quotes_carousel.dart';
import 'start_session_card.dart';
import 'recommended_list.dart';

class HomeScreen extends StatelessWidget {
  final bool hasCompletedQuestionnaire;
  const HomeScreen({super.key, this.hasCompletedQuestionnaire = false});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const HomeTopBar(),
              const SizedBox(height: 24),
              const Text(
                'Good Morning, Hamza!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'How would you like to start your day?',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 24),
              const QuotesCarousel(),
              const SizedBox(height: 24),
              StartSessionCard(
                hasCompletedQuestionnaire: hasCompletedQuestionnaire,
              ),
              const SizedBox(height: 24),
              const Text(
                'Recommended for you',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const RecommendedList(),
            ],
          ),
        ),
      ),
    );
  }
}
