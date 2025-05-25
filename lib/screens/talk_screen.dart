import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import './home/home_top_bar.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../widgets/background.dart';

class TalkScreen extends StatefulWidget {
  const TalkScreen({super.key});

  @override
  State<TalkScreen> createState() => _TalkScreenState();
}

class _TalkScreenState extends State<TalkScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  final List<_Message> _messages = [];
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  final List<String> _botResponses = [
    "Take slow, deep breaths and focus on what you can see, hear, and feel around you.\nYou're safe right now — this moment will pass.",
    "I'm here for you. Just type how you're feeling.",
    "Try grounding yourself: name 5 things you can see, 4 you can touch, 3 you can hear.",
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
    _animationController.forward(); // Initial animation
    _messages.add(
      _Message(
        text: "Hello! I'm here to help you. How can I assist you today?",
        isUser: false,
      ),
    ); // Welcome message
  }

  @override
  void dispose() {
    _animationController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      _messages.add(_Message(text: _controller.text.trim(), isUser: true));
      _messages.add(
        _Message(
          text: _botResponses[Random().nextInt(_botResponses.length)],
          isUser: false,
        ),
      );
      _controller.clear();
      _animationController.forward(
        from: 0,
      ); // Trigger animation for new messages
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevent resizing when keyboard appears
      extendBody: true,
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              const HomeTopBar(),
              const SizedBox(height: 10),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(78, 129, 112, 1),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(9, 0, 0, 0),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final msg = _messages[index];
                      return FadeTransition(
                        opacity: _fadeAnimation,
                        child: Align(
                          alignment:
                              msg.isUser
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment:
                                msg.isUser
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (!msg.isUser)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: Image.asset(
                                    'assets/images/talking_bot.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                              Flexible(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 6,
                                  ),
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color:
                                        msg.isUser
                                            ? const Color(0xFF4E8170)
                                            : const Color.fromARGB(
                                              255,
                                              255,
                                              255,
                                              255,
                                            ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: const Radius.circular(12),
                                      topRight: const Radius.circular(12),
                                      bottomLeft:
                                          msg.isUser
                                              ? const Radius.circular(12)
                                              : const Radius.circular(0),
                                      bottomRight:
                                          msg.isUser
                                              ? const Radius.circular(0)
                                              : const Radius.circular(12),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 4,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          msg.text,
                                          style: TextStyle(
                                            color:
                                                msg.isUser
                                                    ? Colors.white
                                                    : Colors.black87,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      if (!msg.isUser)
                                        Transform.translate(
                                          offset: const Offset(
                                            0,
                                            12,
                                          ), // Move tip to bottom left
                                          child: CustomPaint(
                                            painter: TrianglePainter(
                                              flip: false,
                                            ),
                                            child: const SizedBox(
                                              width: 12,
                                              height: 12,
                                            ),
                                          ),
                                        ),
                                      if (msg.isUser)
                                        Transform.translate(
                                          offset: const Offset(
                                            0,
                                            -12,
                                          ), // Move tip to top right
                                          child: CustomPaint(
                                            painter: TrianglePainter(
                                              flip: true,
                                            ),
                                            child: const SizedBox(
                                              width: 12,
                                              height: 12,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
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
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: TextField(
                          controller: _controller,
                          decoration: const InputDecoration.collapsed(
                            hintText: "Write your message",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: _sendMessage,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Color(0xFF4E8170),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.send, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: CustomBottomNavBar(
          currentIndex: 2, // Index for "Talk"
          onTap: (index) {
           
          },
        ),
      ),
    );
  }
}

class _Message {
  final String text;
  final bool isUser;

  _Message({required this.text, required this.isUser});
}

class TrianglePainter extends CustomPainter {
  final bool flip;

  TrianglePainter({this.flip = false});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()..color = flip ? const Color(0xFF4E8170) : Colors.white70;
    final path = Path();
    if (flip) {
      path.moveTo(0, size.height);
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.height);
    } else {
      path.moveTo(0, 0);
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
