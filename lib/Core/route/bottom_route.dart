import'package:flutter/material.dart';
import 'package:nextuse/Screen/homepage.dart';
import 'package:nextuse/Screen/inventory.dart';

void navigate(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
      break;

    case 1:
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Inventory()),
      );
      break;

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