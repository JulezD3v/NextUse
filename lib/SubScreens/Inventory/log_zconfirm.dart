import 'package:flutter/material.dart';
import '/A_Core/Constants/Colors/color.dart';
import '/A_Core/widgets/bottom_nav.dart';
import '/A_Core/route/bottom_route.dart';
import '/HomePage/item_widget/grid_tile.dart';
import './widget/top_nav.dart';
import './widget/regulation.dart';
import './widget/success_popup.dart';
import 'package:nextuse/A_Core/widgets/sectionCard.dart';
import 'log_item.dart';

class ConfirmPage extends StatefulWidget {
  final GridItem selectedItem;
  final int quantity;

  const ConfirmPage({
    super.key,
    required this.selectedItem,
    required this.quantity,
  });

  @override
  State<ConfirmPage> createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  bool isClean = false;
  bool isFreeOfGlue = false;

  bool get canProceed => isClean && isFreeOfGlue;

  void _onDone() {
    if (!canProceed) return;
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      builder: (_) => SuccessPopup(
        item: widget.selectedItem,
        quantity: widget.quantity,
        onViewItem: () {
          Navigator.pop(context); // close popup
          // TODO: navigate to item detail page
        },
        onLogAnother: () {
          Navigator.pop(context); // close popup
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const LogItem()),
            (route) => route.isFirst,
          );
        },
        onDismiss: () => Navigator.pop(context),
      ),
    );
  }

  void _onSaveDraft() {
    // TODO: save draft logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Draft saved')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Background.mainbg,
      bottomNavigationBar: CustomNavBar(
        selectedIndex: 0,
        onTap: (index) => navigate(context, index),
      ),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TabContainerCard(
          primaryTabText: "Confirm item",
          secondaryTabText: " Step 3 of 3 ",
          containerHeight: 180,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header text
                const Text(
                  'Confirm that the item meets local regulations',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF5A5440),
                  ),
                ),

                const SizedBox(height: 16),

                // Checkbox 1
                RegulationCheckbox(
                  label: 'Item is clean',
                  value: isClean,
                  onChanged: (val) => setState(() => isClean = val ?? false),
                ),

                const SizedBox(height: 10),

                // Checkbox 2
                RegulationCheckbox(
                  label: 'Item is free of glue, staples, and stickers',
                  value: isFreeOfGlue,
                  onChanged: (val) =>
                      setState(() => isFreeOfGlue = val ?? false),
                ),

                const Spacer(),

                // Buttons row
                Row(
                  children: [
                    // Save Draft
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: _onSaveDraft,
                        icon: const Icon(Icons.save_outlined, size: 16),
                        label: const Text('Save draft'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF6B6347),
                          side: const BorderSide(color: Color(0xFFB8AE8B)),
                          backgroundColor: const Color(0xFFE8E2CC),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    // Done
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: canProceed ? _onDone : null,
                        iconAlignment: IconAlignment.end,
                        icon: Icon(
                          Icons.check_circle_outline,
                          size: 16,
                          color: canProceed
                              ? const Color(0xFF3C3830)
                              : Colors.grey,
                        ),
                        label: const Text('Done'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: const Color(0xFF3C3830),
                          backgroundColor: canProceed
                              ? const Color(0xFFD4CFA0)
                              : Colors.grey.shade300,
                          disabledForegroundColor: Colors.grey,
                          disabledBackgroundColor: Colors.grey.shade300,
                          padding: const EdgeInsets.symmetric(vertical: 14),
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


