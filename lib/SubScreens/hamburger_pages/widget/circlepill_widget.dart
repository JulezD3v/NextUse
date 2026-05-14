// shared_widgets.dart
import 'package:flutter/material.dart';
class CircleNav extends StatefulWidget {
  const CircleNav({super.key});

  @override
  State<CircleNav> createState() => _CircleNavState();
}

class _CircleNavState extends State<CircleNav> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
class CircleBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFFF0EDE6),
          border: Border.all(
            color: const Color(0xFFBFB48A),
            width: 1.5,
          ),
        ),
        child: const Icon(
          Icons.chevron_left,
          color: Color(0xFF4A3F2F),
          size: 24,
        ),
      ),
    );
  }
}

class PillTitle extends StatelessWidget {
  final String title;
  const PillTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF0EDE6),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: const Color(0xFFBFB48A),
          width: 1.5,
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF4A3F2F),
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}