import 'package:flutter/material.dart';
class Humburger extends StatefulWidget {
  const Humburger({super.key});

  @override
  State<Humburger> createState() => _HumburgerState();
}

class _HumburgerState extends State<Humburger> {
  @override
  
class Humburger extends StatelessWidget {
  final String name;
  final ImageProvider? image;
  final double width;
  final VoidCallback? onEditProfile;
  final VoidCallback? onSettings;
  final VoidCallback? onSupport;
  final VoidCallback? onPrivacyAbout;

  const Humburger({
    super.key,
    required this.name,
    this.image,
    this.width = 45,
    this.onEditProfile,
    this.onSettings,
    this.onSupport,
    this.onPrivacyAbout,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Standard drawer width – does NOT cover the whole screen horizontally
      child: SafeArea(
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.green),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: width / 2,
                    backgroundImage: image,
                    child: image == null ? const Icon(Icons.person) : null,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    name,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit Profile'),
              onTap: onEditProfile ?? () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: onSettings ?? () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.support_agent),
              title: const Text('Support'),
              onTap: onSupport ?? () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text('Privacy & About'),
              onTap: onPrivacyAbout ?? () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}