import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({
    super.key,
    required this.icon,
    required this.label,
  });
  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Icon
        Icon(icon),
        const SizedBox(
          width: 8,
        ),

        // Label
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
