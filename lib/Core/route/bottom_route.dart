import'package:flutter/material.dart';
import 'package:nextuse/Screens/homepage.dart';

void navigate(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
      break;

    // case 1:
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (_) => const InventoryScreen()),
    //   );
    //   break;

    // case 2:
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (_) => const PickupScreen()),
    //   );
    //   break;

    // case 3:
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (_) => const WalletScreen()),
    //   );
    //   break;
  }
}