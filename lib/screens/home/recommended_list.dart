import 'package:flutter/material.dart';

class RecommendedList extends StatelessWidget {
  const RecommendedList({super.key});

  final List<Map<String, String>> recommended = const [
    {
      'title': 'Focus',
      'subtitle': 'Meditation • 3-10 min',
      'image': 'assets/images/reduce_stress.png',
    },
    {
      'title': 'Happiness',
      'subtitle': 'Meditation • 3-10 min',
      'image': 'assets/images/manage_anxiety.png',
    },
    {
      'title': 'Reduce Stress',
      'subtitle': 'Meditation • 3-10 min',
      'image': 'assets/images/reduce_stress.png',
    },
    {
      'title': 'Manage Anxiety',
      'subtitle': 'Meditation • 3-10 min',
      'image': 'assets/images/manage_anxiety.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: recommended.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final item = recommended[index];
          return GestureDetector(
            onTap:
                () => Navigator.pushNamed(
                  context,
                  '/exercise_detail',
                  arguments: item,
                ),
            child: Container(
              width: 140,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: Image.asset(
                      item['image']!,
                      height: 90, // Reduced from 100 to 90 to prevent overflow
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0, // Reduced from 8.0 to 4.0 to save space
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14, // Slightly reduced font size
                          ),
                          overflow: TextOverflow.ellipsis, // Prevent wrapping
                          maxLines: 1,
                        ),
                        const SizedBox(height: 2), // Reduced from 4 to 2
                        Text(
                          item['subtitle']!,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 10, // Reduced from 12 to 10
                          ),
                          overflow: TextOverflow.ellipsis, // Prevent wrapping
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
