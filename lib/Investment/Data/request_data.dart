import 'package:flutter/material.dart';

class PickupRequest {
  final String title;
  final String status;
  final int ecoPoints;
  final DateTime date;
  final String wasteType;
  final String location;
  final bool isEligible;  // Derived from status for logic like button enabling

  PickupRequest({
    required this.title,
    required this.status,
    required this.ecoPoints,
    required this.date,
    required this.wasteType,
    required this.location,
    this.isEligible = false,
  });
}