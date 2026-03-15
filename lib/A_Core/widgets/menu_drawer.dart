import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final String name;
  final ImageProvider? image;
  final double width;
  final VoidCallback? onEditProfile;
  final VoidCallback? onSettings;
  final VoidCallback? onSupport;
  final VoidCallback? onPrivacyAbout;

  const AppDrawer({
    super.key,
    this.name = 'Florence Okoye',
    this.image,
    this.width = 280,
    this.onEditProfile,
    this.onSettings,
    this.onSupport,
    this.onPrivacyAbout,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: width,
      backgroundColor: const Color(0xFFF3EFE0),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── PROFILE SECTION ─────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
              child: Row(
                children: [
                  // Avatar
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: image,
                    backgroundColor: const Color(0xFFD6CFA8),
                    child: image == null
                        ? const Icon(Icons.person, color: Color(0xFF7A6F4E))
                        : null,
                  ),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name — not clickable
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3D3820),
                        ),
                      ),
                      const SizedBox(height: 2),
                      // Edit profile — clickable
                      GestureDetector(
                        onTap: onEditProfile,
                        child: const Text(
                          'Edit profile',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF7A6F4E),
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xFF7A6F4E),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // ── MENU ITEMS ───────────────────────────────
            _DrawerItem(
              icon: Icons.settings_outlined,
              label: 'Settings',
              onTap: onSettings,
            ),
            _DrawerItem(
              icon: Icons.help_outline,
              label: 'Support',
              onTap: onSupport,
            ),
            _DrawerItem(
              icon: Icons.info_outline,
              label: 'Privacy & About',
              onTap: onPrivacyAbout,
            ),

          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const _DrawerItem({
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        child: Row(
          children: [
            Icon(icon, size: 24, color: const Color(0xFF5A5030)),
            const SizedBox(width: 16),
            Text(
              label,
              style: const TextStyle(
                fontSize: 17,
                color: Color(0xFF3D3820),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}