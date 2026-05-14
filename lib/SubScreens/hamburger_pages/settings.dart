import 'package:flutter/material.dart';
import './widget/circlepill_widget.dart';
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFFF0EDE6);
    const dividerColor = Color(0xFFD6CEB8);
    const itemColor = Color(0xFF5C5240);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Top bar
              // Top bar
                  CircleNav(initialTitle: "Settings"),

              const SizedBox(height: 36),

              // Settings items
              _SettingsItem(
                icon: Icons.contrast,
                label: 'Appearance',
                itemColor: itemColor,
                dividerColor: dividerColor,
              ),
              _SettingsItem(
                icon: Icons.notifications_active_outlined,
                label: 'Notifications',
                itemColor: itemColor,
                dividerColor: dividerColor,
              ),
              _SettingsItem(
                icon: Icons.accessibility_new,
                label: 'Accessibility',
                itemColor: itemColor,
                dividerColor: dividerColor,
              ),
              _SettingsItem(
                icon: Icons.manage_accounts_outlined,
                label: 'Account',
                itemColor: itemColor,
                dividerColor: dividerColor,
                isLast: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingsItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color itemColor;
  final Color dividerColor;
  final bool isLast;

  const _SettingsItem({
    required this.icon,
    required this.label,
    required this.itemColor,
    required this.dividerColor,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            children: [
              Icon(icon, color: itemColor, size: 28),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    color: itemColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(Icons.chevron_right, color: itemColor, size: 24),
            ],
          ),
        ),
        if (!isLast)
          Divider(color: dividerColor, thickness: 1, height: 0),
      ],
    );
  }
}