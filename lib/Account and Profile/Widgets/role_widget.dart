import 'package:flutter/material.dart';
import 'package:nextuse/Colors/color.dart';

enum UserRole { user, pickupAgent, company }
class RoleSelector extends StatelessWidget {
  final UserRole? selectedRole;
  final Function(UserRole) onChanged;

  const RoleSelector({
    super.key,
    required this.selectedRole,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: UserRole.values.map((role) {
        return buildRoleOption(role);
      }).toList(),
    );
  }

  Widget buildRoleOption(UserRole role) {
    final bool isSelected = selectedRole == role;

    return Expanded(
      child: GestureDetector(
        onTap: () => onChanged(role),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? ButtonCol().mybtn : Background().containbg,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: const Color(0xFF8AAE3F),
            ),
          ),
          child: Center(
            child: Text(
              getRoleTitle(role),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? Background().mainbg
                    : const Color(0xFF6E7F3F),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String getRoleTitle(UserRole role) {
    switch (role) {
      case UserRole.user:
        return "User";
      case UserRole.pickupAgent:
        return "Pickup Agent";
      case UserRole.company:
        return "Company";
    }
  }
}
