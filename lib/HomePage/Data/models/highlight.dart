
import 'package:flutter/material.dart';
class Highlight {
  final String title;              // e.g. "You are the highest resident earner..."
  final String period;             // "February's Earnings"
  final double earnings;           // 31680.0
  final double totalPlasticKg;     // 50.0
  final int cansRecycled;          // e.g. visualized as bins

  Highlight({
    required this.title,
    required this.period,
    required this.earnings,
    required this.totalPlasticKg,
    required this.cansRecycled,
  });
}

class WasteStat {
  final String type;      // "Plastics", "Paper", etc.
  final double quantityKg;
  final IconData icon;    // We'll map to icons

  WasteStat(this.type, this.quantityKg, this.icon);
}

// Backend dev notes
// the data we are working with for the homepage