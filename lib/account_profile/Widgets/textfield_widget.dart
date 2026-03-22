import 'package:flutter/material.dart';
import 'package:nextuse/A_Core/Constants/Colors/color.dart';
import 'package:nextuse/A_Core/Constants/Colors/palette.dart';

class AuthTextField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final bool obscure;
  final TextEditingController? controller;
  
  const AuthTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    this.obscure = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          label,
          style:TextStyle(fontSize: 16,color: TextCol.gentext, fontWeight:FontWeight.w600),
        ),

        const SizedBox(height: 8),

        Container(
          
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 12,
                offset: Offset(0, 6),
              ),
              BoxShadow(
                color: Colors.white.withOpacity(0.6),
                blurRadius: 6,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            obscureText: obscure,
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: ButtonCol.btnIcon),
              hintText: hint,
              filled: true,
              fillColor: Background.mainbg,

              // 👇 proper borders
              contentPadding: EdgeInsets.symmetric(vertical: 14),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: GreenColors.c900),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: GreenColors.c900, width: 2),
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}

