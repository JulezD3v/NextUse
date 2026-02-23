import 'package:flutter/material.dart';
import'/HomePage/Data/models/highlight.dart';
abstract class HomeRepository {
  Future<Highlight> getHighlights();
  Future<List<WasteStat>> getRecentStats();
}