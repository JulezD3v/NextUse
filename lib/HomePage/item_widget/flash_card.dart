import 'package:flutter/material.dart';

class FlatCard extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final Widget? child;
  final EdgeInsets? padding;

  const FlatCard({
    super.key,
    this.width,
    this.height = 36.9,
    this.color,
    this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.fromLTRB(2, 3, 2, 0),
      child: Container(
        width: width ?? 310.3,
        height: height,
        decoration: BoxDecoration(
          color: color ?? const Color(0xFFF5F0DC),
        ),
        child: child,
      ),
    );
  }
}

// // Bare minimum
// FlatCard()

// // Custom colors and size
// FlatCard(
//   width: 350,
//   height: 50,
//   color: Colors.white,
// )

// // With a child
// FlatCard(
//   width: 310,
//   color: Color(0xFFF5F0DC),
//   child: Text('Hello'),
// )