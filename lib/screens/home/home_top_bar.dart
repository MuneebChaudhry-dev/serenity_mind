import 'package:flutter/material.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(24),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white, // White background
              shape: BoxShape.circle, // Explicitly set to circle
            ),
            padding: const EdgeInsets.all(8.0), // Uniform padding
            child: const Icon(
              Icons.person_outline,
              color: Color.fromRGBO(78, 129, 112, 1), // Green icon
              size: 25,
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Image.asset('assets/images/logo.png', width: 39),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, // Solid white background
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Text('SOS', style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
