import 'package:flutter/material.dart';
import 'package:nextuse/HomePage/color_palette.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final int count;
  final IconData? icon;        // swap for image later
  final Color? cardColor;
  final Color? labelColor;
  final Color? countBadgeColor;

  const ItemCard({
    super.key,
    required this.title,
    required this.count,
    this.icon,
    this.cardColor,
    this.labelColor,
    this.countBadgeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cardColor ?? AppColors.tabUnselected,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black), // ← fixed BoxBorder → Border
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    icon ?? Icons.recycling,
                    size: 30,
                    color: AppColors.textPrimary,
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 6,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: countBadgeColor ?? AppColors.container,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      count.toString(),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: labelColor ?? AppColors.container,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(16),
              ),
            ),
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}