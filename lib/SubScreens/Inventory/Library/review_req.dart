import 'package:flutter/material.dart';
import '/A_Core/Constants/Colors/color.dart';
import '/A_Core/widgets/bottom_nav.dart';
import '/A_Core/route/bottom_route.dart';
import '/HomePage/item_widget/grid_tile.dart';
import '../widget/top_nav.dart';
import '/A_Core/widgets/sectionCard.dart';

// ── Data model for a pickup item ──────────────────────────────
class PickupItem {
  final GridItem item;
  final int quantity;
  final int ecoPoints;

  const PickupItem({
    required this.item,
    required this.quantity,
    this.ecoPoints = 80,
  });
}

class RequestPickupPage extends StatefulWidget {
  final List<PickupItem> pickupItems;
  final DateTime selectedDate;       // ✅ received from Step 1
  final List<String> selectedSlots;  // ✅ received from Step 1

  const RequestPickupPage({
    super.key,
    required this.pickupItems,
    required this.selectedDate,
    required this.selectedSlots,
  });

  @override
  State<RequestPickupPage> createState() => _RequestPickupPageState();
}

class _RequestPickupPageState extends State<RequestPickupPage> {
  late DateTime selectedDate;
  late List<String> activeSlots;

  final List<String> _allSlots = [
    '08:00 - 10:00',
    '10:00 - 12:00',
    '12:00 - 14:00',
    '14:00 - 16:00',
    '16:00 - 18:00',
  ];

  @override
  void initState() {
    super.initState();
    selectedDate = widget.selectedDate;
    activeSlots = List.from(widget.selectedSlots);
  }

  int get totalEcoPoints =>
      widget.pickupItems.fold(0, (sum, i) => sum + i.ecoPoints);

  void _removeSlot(String slot) =>
      setState(() => activeSlots.remove(slot));

  void _addSlot() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFFEDE8D5),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => StatefulBuilder(
        builder: (ctx, setModalState) => Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select a time slot',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF3C3830),
                ),
              ),
              const SizedBox(height: 12),
              ..._allSlots.map((slot) {
                final isSelected = activeSlots.contains(slot);
                return ListTile(
                  dense: true,
                  leading: Icon(
                    isSelected
                        ? Icons.check_circle
                        : Icons.radio_button_unchecked,
                    color: isSelected
                        ? const Color(0xFF7A9E5F)
                        : const Color(0xFFB8AE8B),
                  ),
                  title: Text(slot,
                      style: const TextStyle(
                          fontSize: 14, color: Color(0xFF4A4440))),
                  onTap: () {
                    setModalState(() {
                      if (isSelected) {
                        activeSlots.remove(slot);
                      } else {
                        activeSlots.add(slot);
                      }
                    });
                    setState(() {});
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Map<String, List<PickupItem>> get groupedItems {
    final Map<String, List<PickupItem>> map = {};
    for (final pi in widget.pickupItems) {
      map.putIfAbsent(pi.item.category, () => []).add(pi);
    }
    return map;
  }

  String _formatDate(DateTime d) {
    const months = [
      '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return '${days[d.weekday - 1]}, ${d.day} ${months[d.month]} ${d.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Background.mainbg,
      bottomNavigationBar: CustomNavBar(
        selectedIndex: 2,
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
            title: 'Request Pickup',
            icon: Icons.arrow_back,
            onIconPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Card ──────────────────────────────────────
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF5F0E4),
                borderRadius: BorderRadius.circular(20),
                border:
                    Border.all(color: const Color(0xFFD6CFA8), width: 1.2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TabContainerCard(
                    primaryTabText: 'Request Review',
                    secondaryTabText: ' Step 2 of 2',
                  
                  ),
                  
                  ...groupedItems.entries.map((entry) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(16, 14, 16, 6),
                            child: Text(
                              entry.key,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF3C3830),
                              ),
                            ),
                          ),
                          ...entry.value
                              .map((pi) => _PickupItemRow(pi: pi)),
                        ],
                      )),
                  const SizedBox(height: 6),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ── Total value ───────────────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Value',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF3C3830),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: '~ ',
                        style: TextStyle(
                            fontSize: 15, color: Color(0xFF6B6347)),
                      ),
                      TextSpan(
                        text:
                            '${totalEcoPoints.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')} EP',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF3C3830),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 6),

            RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 11, color: Color(0xFF7A7060)),
                children: [
                  TextSpan(
                      text: 'Note: ',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  TextSpan(
                      text:
                          'EcoPoints listed are an approximation based on average item weight. Amount rewarded might differ slightly.'),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ── Date & Time (passed from Step 1) ──────────
            const Text(
              'Date & Time',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Color(0xFF3C3830),
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                const SizedBox(
                  width: 80,
                  child: Text('Date',
                      style: TextStyle(
                          fontSize: 13, color: Color(0xFF6B6347))),
                ),
                Text(
                  _formatDate(selectedDate),
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3C3830),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 80,
                  child: Text('Time Slots',
                      style: TextStyle(
                          fontSize: 13, color: Color(0xFF6B6347))),
                ),
                Expanded(
                  child: Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      ...activeSlots.map(
                        (slot) => _TimeSlotChip(
                          label: slot,
                          onRemove: () => _removeSlot(slot),
                        ),
                      ),
                      GestureDetector(
                        onTap: _addSlot,
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF7A9E5F),
                          ),
                          child: const Icon(Icons.add,
                              color: Colors.white, size: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // ── Send pickup request ───────────────────────
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: submit pickup request
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF5F0E4),
                  foregroundColor: const Color(0xFF4A4440),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(
                      color: Color(0xFFB8AE8B), width: 1.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text(
                  'Send pickup request',
                  style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // ── Save draft ────────────────────────────────
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEDE8D5),
                  foregroundColor: const Color(0xFF6B6347),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(
                      color: Color(0xFFD6CFA8), width: 1.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text(
                  'Save draft',
                  style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

// ── Item row ──────────────────────────────────────────────────
class _PickupItemRow extends StatelessWidget {
  final PickupItem pi;
  const _PickupItemRow({required this.pi});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFEDE8D5),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFD6CFA8), width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F0E4),
              borderRadius: BorderRadius.circular(10),
            ),
            child: pi.item.imagePath != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(pi.item.imagePath!,
                        fit: BoxFit.contain),
                  )
                : Icon(pi.item.icon ?? Icons.inventory_2,
                    size: 28, color: const Color(0xFF9A9268)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(pi.item.title,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3C3830))),
                const SizedBox(height: 2),
                Text(pi.item.category,
                    style: const TextStyle(
                        fontSize: 11, color: Color(0xFF9A9268))),
                const SizedBox(height: 2),
                Text('Qty: ${pi.quantity}',
                    style: const TextStyle(
                        fontSize: 11, color: Color(0xFF6B6347))),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${pi.ecoPoints} ',
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF3C3830)),
                ),
                const TextSpan(
                  text: 'EcoPoints',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF6B6347)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Time slot chip (removable) ────────────────────────────────
class _TimeSlotChip extends StatelessWidget {
  final String label;
  final VoidCallback onRemove;

  const _TimeSlotChip({required this.label, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFEDE8D5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFB8AE8B), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF4A4440),
                  fontWeight: FontWeight.w500)),
          const SizedBox(width: 4),
          GestureDetector(
            onTap: onRemove,
            child: const Icon(Icons.close,
                size: 14, color: Color(0xFF9A9268)),
          ),
        ],
      ),
    );
  }
}
