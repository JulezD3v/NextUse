import'package:flutter/material.dart';
import'package:nextuse/Colors/color.dart';
class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color colors;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.colors,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: ShapeDecoration(
          color: colors,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          // boxShadow: [
          //   BoxShadow(
          //     color: TextCol().gentext,
          //     blurRadius: 5,
          //     offset: const Offset(0, 6),
          //   )
          // ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color:  Color(0xFF6E7F3F),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
