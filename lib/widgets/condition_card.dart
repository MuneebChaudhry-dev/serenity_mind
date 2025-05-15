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
    Color backgroundColor = isSelected ? Colors.teal[400]! : Colors.teal[200]!;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 50,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (isSelected)
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              Expanded(
                child: Center(
                  child: Text(
                    condition,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
