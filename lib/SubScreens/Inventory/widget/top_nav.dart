import 'package:flutter/material.dart';
import '/A_Core/Constants/Colors/color.dart';

class TopBar extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onIconPressed;

  const TopBar({
    super.key,
    required this.title,
    required this.icon,
    required this.onIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      color: Background.mainbg, // background color

      child: Row(
        children: [
          // 🔹 Icon button (ONLY clickable element)
          GestureDetector(
            onTap: onIconPressed,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFFB8AE8B),
                  width: 2,
                ),
                boxShadow:  [
        BoxShadow(
          color: Colors.black.withOpacity(0.1), // shadow color
          blurRadius: 5, // softness
          spreadRadius: 1, // how wide it spreads
          offset: Offset(0, 2), // x, y (downwards shadow)
        ),
      ],
              ),
              child: Icon(
                icon,
                color: const Color(0xFF6E7F3F),
              ),
            ),
          ),

          const SizedBox(width:25),

          // 🔹 Title
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xFFB8AE8B),
                width: 2,
              ),
              boxShadow:  [
        BoxShadow(
          color: Colors.black.withOpacity(0.2), // shadow color
          blurRadius: 10, // softness
          spreadRadius: 1, // how wide it spreads
          offset: Offset(0, 4), // x, y (downwards shadow)
        ),
      ], 
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF5F5A3F),
              ),
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}