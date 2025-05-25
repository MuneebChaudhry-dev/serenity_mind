import 'package:flutter/material.dart';
import '../../widgets/background.dart'; // Assuming your GradientBackground is here

class QuestionnaireScreen extends StatefulWidget {
  const QuestionnaireScreen({Key? key}) : super(key: key);

  @override
  State<QuestionnaireScreen> createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  final List<Map<String, dynamic>> _questions = [
    {
      "question":
          "Over the past two weeks, how often have you had little interest or pleasure in doing things?",
      "options": ["Never", "Rarely", "Sometimes", "Often", "Always"],
    },
    {
      "question": "How often did you feel nervous, anxious or on edge?",
      "options": ["Never", "Rarely", "Sometimes", "Often", "Always"],
    },
    {
      "question": "Did you experience any panic or anxiety attacks?",
      "options": ["Never", "Rarely", "Sometimes", "Often", "Always"],
    },
    {
      "question": "How often did you feel sad or depressed?",
      "options": ["Never", "Rarely", "Sometimes", "Often", "Always"],
    },
    {
      "question": "How often did you struggle with concentration or focus?",
      "options": ["Never", "Rarely", "Sometimes", "Often", "Always"],
    },
    {
      "question": "Briefly describe your current mental or emotional state.",
      "isTextArea": true,
    },
  ];

  int _currentQuestion = 0;
  Map<int, dynamic> _answers = {};
  final TextEditingController _textController = TextEditingController();

  void _nextQuestion() {
    if (_currentQuestion < _questions.length - 1) {
      setState(() {
        _currentQuestion++;
        if (_questions[_currentQuestion]['isTextArea'] == true) {
          _textController.text = _answers[_currentQuestion] ?? '';
        }
      });
    } else {
      print(_answers); // You can replace this with saving to a database
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final current = _questions[_currentQuestion];

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
                Text(
                  current["question"],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                if (current["isTextArea"] == true)
                  TextField(
                    controller: _textController,
                    onChanged: (val) => _answers[_currentQuestion] = val,
                    maxLines: 6,
                    decoration: InputDecoration(
                      hintText: 'Describe your feelings...',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  )
                else
                  ...List.generate(current["options"].length, (index) {
                    final option = current["options"][index];
                    final isSelected = _answers[_currentQuestion] == option;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _answers[_currentQuestion] = option;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color:
                              isSelected
                                  ? const Color.fromRGBO(78, 129, 112, 0.4)
                                  : const Color.fromRGBO(255, 255, 255, 0.6),
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            option,
                            style: TextStyle(
                              color:
                                  isSelected
                                      ? Colors.white
                                      : const Color(0xFF4E8170),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: _nextQuestion,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4E8170),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    child: Text(
                      _currentQuestion == _questions.length - 1
                          ? "Submit"
                          : "Continue",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
