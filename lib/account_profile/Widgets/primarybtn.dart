
import'package:flutter/material.dart';
//import'package:nextuse/Colors/color.dart';
class PrimaryButton extends StatelessWidget{
final String text;
final Color txtcolors;
final Color colors;
final VoidCallback? onPressed;
  const PrimaryButton({
    super.key,
    required this.text,
    required this.txtcolors,
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
        decoration: BoxDecoration(
  color: colors,
  borderRadius: BorderRadius.circular(25),
  border: Border.all(
    color: Colors.black,
    width: 1,
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
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color:  txtcolors,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
