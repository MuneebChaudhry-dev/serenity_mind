import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import './home/home_top_bar.dart';
import '../widgets/background.dart';

class SelfCareScreen extends StatelessWidget {
  final List<Map<String, dynamic>> selfCareOptions = [
    {
      'title': 'Reduce Stress',
      'color': Color.fromRGBO(128, 138, 255, 1),
      'image': 'assets/images/manage_stress.png',
    },
    {
      'title': 'Improve Performance',
      'color': Color.fromRGBO(250, 110, 90, 1),
      'image': 'assets/images/improve_performance.png',
    },
    {
      'title': 'Increase Happiness',
      'color': Color.fromRGBO(254, 177, 143, 1),
      'image': 'assets/images/increase_happiness.png',
    },
    {
      'title': 'Manage Anxiety',
      'color': Color.fromRGBO(255, 207, 134, 1),
      'image': 'assets/images/manage_anxiety2.png',
    },
    {
      'title': 'Manage Insomnia',
      'color': Color.fromRGBO(78, 85, 103, 1),
      'image': 'assets/images/manage_insomnia.png',
    },
    {
      'title': 'Feel Energatic',
      'color': Color.fromRGBO(108, 178, 142, 1),
      'image': 'assets/images/feel_energatic.png',
    },
  ];

  SelfCareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),

              const SizedBox(height: 10),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Self-Care",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                child: Text(
                  "100+ therapy exercises to manage\nanxiety and more",
                  style: TextStyle(color: Colors.white),
                ),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.builder(
                    itemCount: selfCareOptions.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.85,
                        ),
                    itemBuilder: (context, index) {
                      final option = selfCareOptions[index];
                      return InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/talk');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: option['color'],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Image.asset(
                                    option['image'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 16,
                                left: 12,
                                right: 12,
                                child: Text(
                                  option['title'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 3,
        onTap: (index) {
          // handle navigation
        },
      ),
    );
  }
}
