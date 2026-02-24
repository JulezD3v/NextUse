import 'package:flutter/material.dart';

class ReminderCard extends StatelessWidget {
  final String message;
  final double height;
  final int holeCount; // auto-calculated if null
  final VoidCallback? onViewDetails;
  final VoidCallback? onReschedule;

  const ReminderCard({
    super.key,
    this.message = "Your next pickup is scheduled for Saturday 14 March",
    this.height = 130,
    this.holeCount = 0, // 0 = auto
    this.onViewDetails,
    this.onReschedule,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F0DC), // warm cream
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFD6CFA8), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // LEFT: punched holes column
          _HolesColumn(height: height, holeCount: holeCount),

          // RIGHT: content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 12, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Reminder",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF8A7F5A),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    message,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3D3720),
                      height: 1.4,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: onViewDetails,
                        child: const Text(
                          "View details",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF6B8F5E),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: onReschedule,
                        child: const Text(
                          "Reschedule",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF6B8F5E),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HolesColumn extends StatelessWidget {
  final double height;
  final int holeCount;

  const _HolesColumn({required this.height, required this.holeCount});

  @override
  Widget build(BuildContext context) {
    // Auto-calculate holes based on height if holeCount is 0
    final int count = holeCount > 0 ? holeCount : (height / 36).floor().clamp(1, 20);

    return Container(
      width: 28,
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(color: Color(0xFFD6CFA8), width: 1),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(count, (_) => _Hole()),
      ),
    );
  }
}

class _Hole extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(color: const Color(0xFFD6CFA8), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 3,
            offset: const Offset(1, 1),
          ),
        ],
      ),
    );
  }
}