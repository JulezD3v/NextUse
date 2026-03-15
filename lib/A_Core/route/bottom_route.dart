import'package:flutter/material.dart';
import 'package:nextuse/MainScreens/homepage.dart';
import 'package:nextuse/MainScreens/inventory.dart';
import 'package:nextuse/MainScreens/pickup.dart';
import 'package:nextuse/MainScreens/reward.dart';
import 'package:nextuse/MainScreens/wallet.dart';

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
        MaterialPageRoute(builder: (_) =>  Inventory()),
      );
      break;

    case 2:
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Pickup()),
      );
      break;

    case 3:
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Reward()),
      );
      break;
  }
}