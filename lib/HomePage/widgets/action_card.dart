import 'package:flutter/material.dart';

class QuickActionItem {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final Color? buttonColor;   // ← add
  final Color? iconColor;     // ← add
  final Color? labelColor;    // ← add

  const QuickActionItem({
    required this.icon,
    required this.label,
    this.onTap,
    this.buttonColor,         // ← add
    this.iconColor,           // ← add
    this.labelColor,          // ← add
  });
}
class QuickActionsCard extends StatelessWidget {
  final double height;
  final String title;
  final Color? navbarColor;
  final Color? navbarTextColor;
  final Color? bodyColor;
  final Widget? child;           // ← add this
  final List<QuickActionItem>? actions; // ← make optional now

  const QuickActionsCard({
    super.key,
    this.height = 170,
    this.title = "Quick Actions",
    this.navbarColor,
    this.navbarTextColor,
    this.bodyColor,
    this.child,                  // ← add this
    this.actions,
  });
@override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [

        // NAVBAR
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: navbarColor ??  Color(0xFFCBDEEE),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
            ),
           border: Border.all(
          color: Colors.black,
          width: 1,
        ),
          ),
          child: Text(title,
            style: TextStyle(
              color: navbarTextColor ?? Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),

        // BODY
        Container(
          height: height,
          decoration: BoxDecoration(
            color: Color(0xFFCBDEEE),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            border: Border.all(
          color: Colors.black,
          width: 1,
        ),
          ),
          // ↓ use your own child, or fall back to default action buttons
          child:
              child ??
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: (actions ?? [])
                    .map((action) => _ActionButton(item: action))
                    .toList(),
              ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final QuickActionItem item;

  const _ActionButton({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: item.buttonColor ?? Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(item.icon, size: 28,
              color: item.iconColor ?? const Color(0xFF3A5F7A),
            ),
          ),
          const SizedBox(height: 8),
          Text(item.label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              color: item.labelColor ?? const Color(0xFF2A4A5E),
              fontWeight: FontWeight.w500,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}