import'package:flutter/material.dart';
import '/HomePage/color_palette.dart';
class ReminderCard extends StatelessWidget {
  final String title;
  final String message;
  final bool showActions;

  const ReminderCard({
    super.key,
    required this.title,
    required this.message,
    this.showActions = true, //  optional
  });

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.container,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.border,
          width: 2,
        ),
      ),
      child: SingleChildScrollView(
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
              /// TITLE
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
          
              const SizedBox(height: 8),
          
              /// MESSAGE
              Text(
                message,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textPrimary,
                ),
              ),
          
              if (showActions) ...[
                const SizedBox(height: 12),
          
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "View details",
                        style: TextStyle(
                          color: AppColors.accent,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Reschedule",
                        style: TextStyle(
                          color: AppColors.accent,
                        ),
                      ),
                    ),
                  ],
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}