import 'package:flutter/material.dart';
import '../../Core/Constants/Colors/color.dart';

/// Reusable Page Header (pill-shaped, left-aligned)
/// Text + leading icon changes per page
/// Used in every screen (Home, Inventory, Pickup, Wallet, etc.)
class PageHeader extends StatelessWidget {
  final String title;                    // e.g. "NextUse", "Inventory", "Schedule Pickup"
  final IconData leadingIcon;            // e.g. Icons.menu, Icons.arrow_back, Icons.inventory
  final VoidCallback onLeadingTap;
  final VoidCallback? onNotificationTap; // optional, null = hide bell

  const PageHeader({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.onLeadingTap,
    this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // LEFT PILL (changes per page)
          GestureDetector(
            onTap: onLeadingTap,
            child: Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Background.containbg,
                borderRadius: BorderRadius.circular(999),
                border: Border.all(color: Background.gridbg, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    leadingIcon,
                    color: TextCol.gentext,
                    size: 24,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: TextCol.gentext,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // RIGHT NOTIFICATION (only show when provided)
          if (onNotificationTap != null)
            IconButton(
              icon: const Icon(Icons.notifications_outlined, size: 26),
              color: TextCol.gentext,
              onPressed: onNotificationTap,
            ),
        ],
      ),
    );
  }
}