import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/background.dart';
import '../widgets/condition_card.dart';

class SufferingFromScreen extends StatefulWidget {
  const SufferingFromScreen({Key? key}) : super(key: key);

  @override
  State<SufferingFromScreen> createState() => _SufferingFromScreenState();
}

class _SufferingFromScreenState extends State<SufferingFromScreen> {
  String? selectedCondition;
  final List<String> conditions = [
    'Depression',
    'Stress',
    'Anxiety',
    'Insomnia',
    'I don\'t know',
  ];

  Future<void> _saveAndContinue() async {
    if (selectedCondition == null) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('suffering_from', selectedCondition!);
    Navigator.pushNamed(context, '/next_screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 24),
                Image.asset('assets/images/logo.png', width: 100),
                const SizedBox(height: 32),
                const Text(
                  'I am suffering from',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:
                          conditions
                              .sublist(0, 2)
                              .map(
                                (condition) => ConditionCard(
                                  condition: condition,
                                  isSelected: selectedCondition == condition,
                                  onTap: () {
                                    setState(() {
                                      selectedCondition = condition;
                                    });
                                  },
                                ),
                              )
                              .toList(),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:
                          conditions
                              .sublist(2, 4)
                              .map(
                                (condition) => ConditionCard(
                                  condition: condition,
                                  isSelected: selectedCondition == condition,
                                  onTap: () {
                                    setState(() {
                                      selectedCondition = condition;
                                    });
                                  },
                                ),
                              )
                              .toList(),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ConditionCard(
                          condition: conditions[4],
                          isSelected: selectedCondition == conditions[4],
                          onTap: () {
                            setState(() {
                              selectedCondition = conditions[4];
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed:
                        selectedCondition != null ? _saveAndContinue : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    child: const Text(
                      'CONTINUE',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF7BAE9D),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
