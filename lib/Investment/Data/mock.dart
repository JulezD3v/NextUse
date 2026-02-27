import'package:nextuse/Investment/Data/request_data.dart';

final mockPickupRequest = PickupRequest(
  title: 'Request Another Pickup',
  status: 'Not Eligible - remaining inventory value below 5000 EP',
  ecoPoints: 2294,
  date: DateTime(2026, 3, 28),  // Aligning with current time context
  wasteType: 'Plastics',
  location: '27 Adeyemi Street, Lekki, Lagos, Nigeria',
  isEligible: false,
);