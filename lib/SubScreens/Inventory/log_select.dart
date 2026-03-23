import 'package:flutter/material.dart';
import 'package:nextuse/SubScreens/Inventory/log_zconfirm.dart';
import '/A_Core/Constants/Colors/color.dart';
import '/A_Core/widgets/bottom_nav.dart';
import '/A_Core/route/bottom_route.dart';
import '/HomePage/item_widget/grid_tile.dart';
import '/HomePage/item_widget/itemgrid_widget.dart';
import './widget/top_nav.dart';
import 'package:nextuse/A_Core/widgets/sectionCard.dart';

class QuantityPage extends StatefulWidget {
  final GridItem selectedItem;

  const QuantityPage({super.key, required this.selectedItem});

  @override
  State<QuantityPage> createState() => _QuantityPageState();
}

class _QuantityPageState extends State<QuantityPage> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = 1;
  }

  void _increment() {
    if (quantity < 999
      //quantity < widget.selectedItem.count 
    ){
      setState(() => quantity++);
    }
  }

  void _decrement() {
    if (quantity > 1) {
      setState(() => quantity--);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Background.mainbg,
      bottomNavigationBar: CustomNavBar(
        selectedIndex: 0,
        onTap: (index) => navigate(context, index),
      ),

      // ── AppBar ──────────────────────────────────────────────
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: Align(
          alignment: Alignment.centerLeft,
          child: TopBar(
            title: 'Log Item',
            icon: Icons.arrow_back,
            onIconPressed: () => Navigator.pop(context),
          ),
        ),
      ),

      // ── Body ────────────────────────────────────────────────
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TabContainerCard(
          primaryTabText: "Set quantity",
          secondaryTabText: " Step 2 of 3 ",
          containerHeight: 320,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Selected item card preview
                Expanded(
                  child: Center(
                    child: ItemCard(
                      title: widget.selectedItem.title,
                      count: widget.selectedItem.count,
                      image: widget.selectedItem.imagePath,
                      icon: widget.selectedItem.icon,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // ── Counter ─────────────────────────────────
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F0E4),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                        color: const Color(0xFFD6CFA8), width: 1.2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Minus
                      _CircleIconButton(
                        icon: Icons.remove,
                        onPressed: quantity > 1 ? _decrement : null,
                      ),

                      // Count display
                      Text(
                        '$quantity',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF3C3830),
                        ),
                      ),

                      // Plus
                      _CircleIconButton(
                        icon: Icons.add,
                        onPressed: quantity < widget.selectedItem.count
                            ? _increment
                            : null,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // ── Reselect / Continue ──────────────────────
                Row(
                  children: [
                    // Reselect
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back, size: 16),
                        label: const Text('Reselect'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF6B6347),
                          side: const BorderSide(
                              color: Color(0xFFB8AE8B)),
                          backgroundColor: const Color(0xFFE8E2CC),
                          padding:
                              const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    // Continue
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(context,
                          MaterialPageRoute(builder: (_)=> ConfirmPage(selectedItem: widget.selectedItem, quantity: quantity)));
                        },
                        iconAlignment: IconAlignment.end,
                        icon: const Icon(Icons.arrow_forward, size: 16),
                        label: const Text('Continue'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: const Color(0xFF3C3830),
                          backgroundColor: const Color(0xFFD4CFA0),
                          padding:
                              const EdgeInsets.symmetric(vertical: 14),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Small circle icon button for + and -
class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const _CircleIconButton({required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final isEnabled = onPressed != null;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFFF5F0E4),
          border: Border.all(
            color: isEnabled
                ? const Color(0xFF9A9268)
                : const Color(0xFFCCC9B0),
            width: 1.2,
          ),
        ),
        child: Icon(
          icon,
          size: 18,
          color: isEnabled
              ? const Color(0xFF4A4440)
              : const Color(0xFFB0AB95),
        ),
      ),
    );
  }
}