import 'package:flutter/material.dart';
import '/A_Core/Constants/Colors/color.dart';
import '/A_Core/widgets/bottom_nav.dart';
import '/A_Core/route/bottom_route.dart';
import '/SubScreens/Inventory/widget/top_nav.dart';
import 'review_req.dart';

class SelectDateTimePage extends StatefulWidget {
  final List<PickupItem> pickupItems;

  const SelectDateTimePage({
    super.key,
    required this.pickupItems,
  });

  @override
  State<SelectDateTimePage> createState() => _SelectDateTimePageState();
}

class _SelectDateTimePageState extends State<SelectDateTimePage> {
  DateTime focusedMonth = DateTime.now();
  DateTime? selectedDate;
  final Set<String> selectedSlots = {};

  final List<String> _allSlots = [
    '08:00 - 10:00',
    '10:00 - 12:00',
    '12:00 - 14:00',
    '14:00 - 16:00',
    '16:00 - 18:00',
  ];

  void _prevMonth() => setState(() =>
      focusedMonth = DateTime(focusedMonth.year, focusedMonth.month - 1));

  void _nextMonth() => setState(() =>
      focusedMonth = DateTime(focusedMonth.year, focusedMonth.month + 1));

  void _toggleSlot(String slot) => setState(() {
        selectedSlots.contains(slot)
            ? selectedSlots.remove(slot)
            : selectedSlots.add(slot);
      });

  bool get canContinue => selectedDate != null && selectedSlots.isNotEmpty;

  void _onContinue() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RequestPickupPage(
          pickupItems: widget.pickupItems,
          selectedDate: selectedDate!,
          selectedSlots: selectedSlots.toList(),
        ),
      ),
    );
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
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF5F0E4),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFD6CFA8), width: 1.2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Header tab ─────────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
                child: Row(
                  children: [
                    const Text(
                      'Select Date & Time',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF3C3830),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD4CFA0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Step 1 of 2',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF5A5440),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(height: 1, color: Color(0xFFD6CFA8)),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select your preferred pickup date.',
                      style:
                          TextStyle(fontSize: 13, color: Color(0xFF6B6347)),
                    ),

                    const SizedBox(height: 14),

                    _CustomCalendar(
                      focusedMonth: focusedMonth,
                      selectedDate: selectedDate,
                      onDateSelected: (d) =>
                          setState(() => selectedDate = d),
                      onPrevMonth: _prevMonth,
                      onNextMonth: _nextMonth,
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'Select your preferred timeslots.',
                      style:
                          TextStyle(fontSize: 13, color: Color(0xFF6B6347)),
                    ),

                    const SizedBox(height: 12),

                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: _allSlots
                          .map((slot) => _SlotChip(
                                label: slot,
                                selected: selectedSlots.contains(slot),
                                onTap: () => _toggleSlot(slot),
                              ))
                          .toList(),
                    ),

                    const SizedBox(height: 24),

                    // Continue
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: canContinue ? _onContinue : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD4CFA0),
                          foregroundColor: const Color(0xFF4A4440),
                          disabledBackgroundColor: Colors.grey.shade300,
                          elevation: 0,
                          padding:
                              const EdgeInsets.symmetric(vertical: 16),
                          side: const BorderSide(
                              color: Color(0xFF9A9E5F), width: 1.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Save draft
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: save draft logic
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Draft saved')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFEDE8D5),
                          foregroundColor: const Color(0xFF6B6347),
                          elevation: 0,
                          padding:
                              const EdgeInsets.symmetric(vertical: 16),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomCalendar extends StatelessWidget {
  final DateTime focusedMonth;
  final DateTime? selectedDate;
  final ValueChanged<DateTime> onDateSelected;
  final VoidCallback onPrevMonth;
  final VoidCallback onNextMonth;

  const _CustomCalendar({
    required this.focusedMonth,
    required this.selectedDate,
    required this.onDateSelected,
    required this.onPrevMonth,
    required this.onNextMonth,
  });

  int get _daysInMonth =>
      DateTime(focusedMonth.year, focusedMonth.month + 1, 0).day;
  int get _firstWeekday =>
      DateTime(focusedMonth.year, focusedMonth.month, 1).weekday % 7;
  String get _monthName => const [
        '',
        'January', 'February', 'March', 'April', 'May', 'June',
        'July', 'August', 'September', 'October', 'November', 'December'
      ][focusedMonth.month];

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFEDE8D5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFD6CFA8), width: 1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              7,
              (_) => Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border:
                      Border.all(color: const Color(0xFFD6CFA8), width: 1),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: onPrevMonth,
                  child: const Icon(Icons.chevron_left,
                      color: Color(0xFF4A4440), size: 22)),
              Text(
                '$_monthName ${focusedMonth.year}',
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF3C3830)),
              ),
              GestureDetector(
                  onTap: onNextMonth,
                  child: const Icon(Icons.chevron_right,
                      color: Color(0xFF4A4440), size: 22)),
            ],
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7, childAspectRatio: 1),
            itemCount: _firstWeekday + _daysInMonth,
            itemBuilder: (context, index) {
              if (index < _firstWeekday) return const SizedBox();
              final day = index - _firstWeekday + 1;
              final date =
                  DateTime(focusedMonth.year, focusedMonth.month, day);
              final isSelected = selectedDate != null &&
                  selectedDate!.year == date.year &&
                  selectedDate!.month == date.month &&
                  selectedDate!.day == date.day;
              final isPast = date.isBefore(
                  DateTime(today.year, today.month, today.day));
              return GestureDetector(
                onTap: isPast ? null : () => onDateSelected(date),
                child: Container(
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected
                        ? const Color(0xFF4A7A9B)
                        : Colors.transparent,
                  ),
                  child: Center(
                    child: Text(
                      '$day',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w400,
                        color: isSelected
                            ? Colors.white
                            : isPast
                                ? const Color(0xFFBBB5A0)
                                : const Color(0xFF3C3830),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SlotChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _SlotChip(
      {required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFFEAF0FB)
              : const Color(0xFFF5F0E4),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: selected
                ? const Color(0xFF7AABCF)
                : const Color(0xFFB8AE8B),
            width: selected ? 1.8 : 1.2,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight:
                selected ? FontWeight.w600 : FontWeight.w400,
            color: selected
                ? const Color(0xFF2D6A8F)
                : const Color(0xFF4A4440),
          ),
        ),
      ),
    );
  }
}