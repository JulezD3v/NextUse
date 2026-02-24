import 'package:flutter/material.dart';
import '../Constants/Colors/color.dart'; // adjust path if needed

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;
  

  const CustomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),

      decoration: BoxDecoration(
        color: Background.containbg,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: ButtonCol.btnbound,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(
            index: 0,
            icon: Icons.home_outlined,
            label: "Home",
          ),
          _buildNavItem(
            index: 1,
            icon: Icons.inventory_2_outlined,
            label: "Inventory",
          
          ),
          _buildNavItem(
            index: 2,
            icon: Icons.local_shipping_outlined,
            label: "Pickup",
          ),
          _buildNavItem(
            index: 3,
            icon: Icons.account_balance_wallet_outlined,
            label: "Wallet",
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String label,
    bool isCenter = false,
  }) {
    final bool isSelected = selectedIndex == index;

    if (isCenter) {
      return GestureDetector(
        onTap: () => onTap(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: isSelected
                    ? ButtonCol.btnHi
                    : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isSelected
                    ? Colors.white
                    : TextCol.gentext,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected
                    ? TextCol.txtcol
                    : TextCol.gentext,
                fontWeight:
                    isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      );
    }

    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected
                ? TextCol.txtcol
                : TextCol.gentext,
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected
                  ? TextCol.txtcol
                  : TextCol.gentext,
            ),
          ),
        ],
      ),
    );
  }
}