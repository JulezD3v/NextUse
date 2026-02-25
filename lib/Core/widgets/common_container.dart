import 'package:flutter/material.dart';
//Normal box
class HighlightCard extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;

  const HighlightCard({
    super.key,
    this.child,
    this.color,
    this.width,
    this.height,
    this.borderRadius,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      padding: padding ?? const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color ?? const Color(0xFFDCE8CF),
        borderRadius: borderRadius ?? BorderRadius.circular(16),
        border: Border.all(width: 1),
      ),
      child: child,
    );
  }
}

//usage notes btw
// Empty
// HighlightCard()

// // With your own content
// HighlightCard(
//   color: Colors.blue.shade50,
//   height: 200,
//   child: Column(
//     children: [
//       Text('Anything here'),
//       ItemsGrid(...),
//     ],
//   ),
// )

// // Inside NotebookCard
// NotebookCard(
//   title: 'My Highlights',
//   child: HighlightCard(
//     child: YourWidget(),
//   ),
// )