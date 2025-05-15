import 'package:flutter/material.dart';

class StartSessionCard extends StatelessWidget {
  final bool hasCompletedQuestionnaire;
  const StartSessionCard({super.key, required this.hasCompletedQuestionnaire});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          hasCompletedQuestionnaire ? '/exercises' : '/questionnaire',
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(
              78,
              129,
              112,
              1,
            ), // Background color rgba(78, 129, 112, 1)
            image: const DecorationImage(
              image: AssetImage(
                'assets/images/bg_start.png',
              ), // Replace with your PNG image path
              fit:
                  BoxFit
                      .cover, // Adjust fit as needed (e.g., BoxFit.fill, BoxFit.contain)
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hasCompletedQuestionnaire
                          ? 'Start therapy session'
                          : 'Start questionnaire',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      hasCompletedQuestionnaire
                          ? 'Meditation • 3-10 min'
                          : 'Questions • 5-7 min',
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
                const Icon(
                  Icons.play_circle_fill,
                  size: 40,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
