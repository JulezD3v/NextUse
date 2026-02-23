import '../models/highlight.dart';
import 'home_repo.dart';
import 'package:flutter/material.dart';

class MockHomeRepository implements HomeRepository {
  @override
  Future<Highlight> getHighlights() async {
    await Future.delayed(const Duration(seconds: 1)); // simulate network
    return Highlight(
      title: "You are the highest resident earner in your neighbourhood this month!",
      period: "February's Earnings",
      earnings: 31680.0,
      totalPlasticKg: 50.0,
      cansRecycled: 12, // e.g. 12 wheelie bins
    );
  }

  @override
  Future<List<WasteStat>> getRecentStats() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return [
      WasteStat("Plastics", 3.0, Icons.recycling),
      WasteStat("Paper", 1.0, Icons.book),
      WasteStat("Metals", 10.0, Icons.construction),
      WasteStat("Glass", 1.0, Icons.wine_bar),
    ];
  }
}