import 'package:flutter/material.dart';


class CircleNav extends StatefulWidget {
  final String initialTitle;
  const CircleNav({
    super.key, 
    required this.initialTitle});

  @override
  State<CircleNav> createState() => _CircleNavState();
}

class _CircleNavState extends State<CircleNav> {
  late String _title;

  @override
  void initState() {
    super.initState();
    _title = widget.initialTitle;  // Set initial title
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
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
        ),

     const SizedBox(width: 16,),
  
 Container(
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
        _title,
        style: const TextStyle(
          color: Color(0xFF4A3F2F),
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
    ]
    );
  }
}