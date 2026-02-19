import 'package:flutter/material.dart';
import 'package:nextuse/Colors/color.dart';

class AuthTextField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final bool obscure;

  const AuthTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          label,
          style:TextStyle(fontSize: 16,color: TextCol().gentext,),
        ),

        const SizedBox(height: 8),

        TextField(
          obscureText: obscure,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color:ButtonCol().btnIcon),
            hintText: hint,
            filled: true,
            fillColor: TextCol().txtfield,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}

// Align(
//                     alignment: Alignment.centerLeft,
//                     child: const Text(
//                       "Email",
//                       style: TextStyle(
//                         color: Color(0xFF8B7E54),
//                       ),
//                     ),
//                   ),
              
//                   const SizedBox(height: 8),
              
//                   TextField(
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: const Color(0xFFDCD7C9),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),