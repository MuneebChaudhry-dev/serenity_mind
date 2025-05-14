import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0.6, 0.6), // Approx 79.83% x, 79.19% y
          radius: 1.0,
          colors: [
            Color.fromARGB(238, 123, 174, 157),
            Color.fromARGB(238, 123, 174, 157),
          ],
        ),
      ),
      child: child,
    );
  }
}
