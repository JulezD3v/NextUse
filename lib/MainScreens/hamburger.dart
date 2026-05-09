import 'package:flutter/material.dart';
class Humburger extends StatefulWidget {

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
  
 
  final String name;
  final ImageProvider? image;
  final double width;
  final VoidCallback? onEditProfile;
  final VoidCallback? onSettings;
  final VoidCallback? onSupport;
  final VoidCallback? onPrivacyAbout;
  

  @override
  State<Humburger> createState() => _HumburgerState();
  
}

class _HumburgerState extends State<Humburger> {

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
                    radius: widget.width / 2,
                    backgroundImage: widget.image,
                    child: widget.image == null ? const Icon(Icons.person) : null,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    widget.name,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit Profile'),
              onTap: widget.onEditProfile ?? () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: widget.onSettings ?? () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.support_agent),
              title: const Text('Support'),
              onTap: widget.onSupport ?? () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text('Privacy & About'),
              onTap: widget.onPrivacyAbout ?? () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
  