
import'package:flutter/material.dart';
//import'package:nextuse/Colors/color.dart';
class PrimaryButton extends StatelessWidget{
final String text;
final Color txtcolors;
final Color colors;
final VoidCallback? onPressed;
final IconData? icon;
  const PrimaryButton({
    super.key,
    required this.text,
    required this.txtcolors,
    required this.colors,
    this.onPressed,
    this.icon,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
             mainAxisSize: MainAxisSize.min,
            children: [
              if(icon != null)...[
               Icon(
                icon, color:Color(0xFF3D3820), size: 22,),
               const SizedBox(width: 8,),],
               Text(
                text,
                textAlign:TextAlign.center ,
                style: TextStyle(
                  color:  txtcolors,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
