
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
        decoration: ShapeDecoration(
          color: colors,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          
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
