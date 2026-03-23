 import 'package:flutter/material.dart';
 import '/HomePage/item_widget/grid_tile.dart';
class SuccessPopup extends StatelessWidget {
  final GridItem item;
  final int quantity;
  final VoidCallback onViewItem;
  final VoidCallback onLogAnother;
  final VoidCallback onDismiss;

  const SuccessPopup({
    super.key,
    required this.item,
    required this.quantity,
    required this.onViewItem,
    required this.onLogAnother,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFEDE8D5),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFFD6CFA8), width: 1.2),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Item title
            Text(
              item.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF3C3830),
              ),
            ),

            const SizedBox(height: 4),

            // Quantity label
            Text(
              '[Qty: $quantity]',
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF7A9E5F),
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 16),

            // Item image with green check overlay
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F0E4),
                    borderRadius: BorderRadius.circular(16),
                    border:
                        Border.all(color: const Color(0xFFD6CFA8), width: 1),
                  ),
                  child: item.imagePath != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.asset(
                            item.imagePath!,
                            fit: BoxFit.contain,
                          ),
                        )
                      : Icon(
                          item.icon ?? Icons.inventory_2,
                          size: 52,
                          color: const Color(0xFF9A9268),
                        ),
                ),
                // Green check badge
                Container(
                  width: 28,
                  height: 28,
                  decoration: const BoxDecoration(
                    color: Color(0xFF7A9E5F),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            // Confirmation text
            const Text(
              'has been added to your inventory',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF6B6347),
                fontWeight: FontWeight.w400,
              ),
            ),

            const SizedBox(height: 18),

            // View item button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: onViewItem,
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF4A4440),
                  side: const BorderSide(color: Color(0xFFB8AE8B)),
                  backgroundColor: const Color(0xFFF5F0E4),
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text(
                  'View item',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Log another item button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: onLogAnother,
                icon: const Icon(Icons.add_circle_outline, size: 16),
                label: const Text('Log another item'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color(0xFF3C3830),
                  backgroundColor: const Color(0xFFD4CFA0),
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 14),

            // Dismiss X button
            GestureDetector(
              onTap: onDismiss,
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFB8AE8B), width: 1.2),
                  color: const Color(0xFFF5F0E4),
                ),
                child: const Icon(
                  Icons.close,
                  size: 18,
                  color: Color(0xFF6B6347),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
