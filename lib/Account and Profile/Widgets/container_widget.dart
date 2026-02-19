import 'package:flutter/material.dart';
import 'package:nextuse/Colors/color.dart';

class AuthContainer extends StatelessWidget {
  final String title;
  final Widget child;

  const AuthContainer({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Background().containbg,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color:  Background().gridbg.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              title,
              style:TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: TextCol().gentext,
              ),
            ),
          ),
          const SizedBox(height: 30),
          child,
        ],
      ),
    );
  }
}
