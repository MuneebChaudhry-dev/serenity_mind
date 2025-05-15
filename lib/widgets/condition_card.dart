import 'package:flutter/material.dart';

class ConditionCard extends StatelessWidget {
  final String condition;
  final bool isSelected;
  final VoidCallback onTap;

  const ConditionCard({
    Key? key,
    required this.condition,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor =
        isSelected
            ? const Color.fromRGBO(78, 129, 112, 0.4)
            : const Color.fromRGBO(255, 255, 255, 0.65);
    ;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        // Removed fixed height to allow padding to expand the container
        padding: const EdgeInsets.symmetric(vertical: 37, horizontal: 24),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color:
                isSelected
                    ? Colors.white
                    : const Color.fromRGBO(78, 129, 112, 1),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                ), // Adjust to avoid overlap with icon
                child: Text(
                  condition,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            if (isSelected)
              Positioned(
                top: -25, // Adjusted from -36 to -20 to make the icon visible
                right: -13,
                child: Icon(Icons.check_circle, color: Colors.white, size: 24),
              )
          ],
        ),
      ),
    );
  }
}
