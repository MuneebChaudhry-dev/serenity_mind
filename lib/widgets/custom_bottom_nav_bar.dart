import 'package:flutter/material.dart';

typedef OnNavItemSelected = void Function(int index);

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final OnNavItemSelected onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  static const activeColor = Color(0xFF4E8170);
  static const inactiveColor = Colors.white70;

  @override
  Widget build(BuildContext context) {
    final items = <_NavItemData>[
      _NavItemData(icon: Icons.home, label: 'Home'),
      _NavItemData(icon: Icons.medical_services, label: 'Therapist'),
      _NavItemData(icon: Icons.chat_bubble_outline, label: 'Talk'),
      _NavItemData(icon: Icons.self_improvement, label: 'Self care'),
      _NavItemData(icon: Icons.book, label: 'Journal'),
    ];

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 40),
      color: const Color(0xFF9EB5AE),
      child: Row(
        children: List.generate(items.length, (i) {
          final item = items[i];
          final selected = i == currentIndex;
          return Expanded(
            child: GestureDetector(
              onTap: () => onTap(i),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  color: selected ? activeColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      item.icon,
                      size: 24,
                      color: selected ? Colors.white : inactiveColor,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.label,
                      style: TextStyle(
                        fontSize: 12,
                        color: selected ? Colors.white : inactiveColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _NavItemData {
  final IconData icon;
  final String label;
  const _NavItemData({required this.icon, required this.label});
}
