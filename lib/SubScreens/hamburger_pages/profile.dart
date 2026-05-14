import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFFF0EDE6);
    const labelColor = Color(0xFFAA9E7E);
    const valueColor = Color(0xFF4A3F2F);
    const dividerColor = Color(0xFFD6CEB8);

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
              Row(
                children: [
                  _CircleBackButton(),
                  const SizedBox(width: 16),
                  _PillTitle(title: 'Profile'),
                ],
              ),

              const SizedBox(height: 36),

              // Profile image
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFBFB48A),
                          width: 3,
                        ),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/profile.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 4,
                      right: 4,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.85),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt_rounded,
                          size: 18,
                          color: Color(0xFF6B6050),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 36),

              // Profile fields
              _ProfileField(
                label: 'Username',
                value: 'Florence Okoye',
                labelColor: labelColor,
                valueColor: valueColor,
                dividerColor: dividerColor,
              ),
              _ProfileField(
                label: 'Email',
                value: 'email@domain.com',
                labelColor: labelColor,
                valueColor: valueColor,
                dividerColor: dividerColor,
              ),
              _ProfileField(
                label: 'Phone number',
                value: '0801 234 5678',
                labelColor: labelColor,
                valueColor: valueColor,
                dividerColor: dividerColor,
              ),
              _ProfileField(
                label: 'Pickup Location',
                value: '27 Adeyemi Street, Lekki,\nLagos, Nigeria',
                labelColor: labelColor,
                valueColor: valueColor,
                dividerColor: dividerColor,
                isLast: true,
              ),

              const SizedBox(height: 40),

              // Logout button
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD4DFB5),
                    foregroundColor: const Color(0xFF4A3F2F),
                    elevation: 4,
                    shadowColor: const Color(0xFF8A9A60).withOpacity(0.4),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(
                        color: Color(0xFF8A9A60),
                        width: 1.5,
                      ),
                    ),
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileField extends StatelessWidget {
  final String label;
  final String value;
  final Color labelColor;
  final Color valueColor;
  final Color dividerColor;
  final bool isLast;

  const _ProfileField({
    required this.label,
    required this.value,
    required this.labelColor,
    required this.valueColor,
    required this.dividerColor,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 120,
                child: Text(
                  label,
                  style: TextStyle(
                    color: labelColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  value,
                  style: TextStyle(
                    color: valueColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(Icons.edit, size: 18, color: labelColor),
            ],
          ),
        ),
        if (!isLast)
          Divider(color: dividerColor, thickness: 1, height: 0),
      ],
    );
  }
}