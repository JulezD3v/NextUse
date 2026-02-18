import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F0E3), // Light beige background

      // =======================
      // CUSTOM APP BAR SECTION
      // =======================
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              // Menu + Logo
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFE5E0CC),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.menu, color: Colors.black54),
                    SizedBox(width: 8),
                    Text(
                      "NextUse",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4B5D1F),
                      ),
                    ),
                  ],
                ),
              ),

              // Notification icon
              CircleAvatar(
                backgroundColor: const Color(0xFFE5E0CC),
                child: const Icon(Icons.notifications_none, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),

      // =======================
      // BODY CONTENT
      // =======================
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // =======================
            // QUICK ACTIONS
            // =======================
            const Text(
              "Quick Actions",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFD7E4F2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  QuickActionItem(icon: Icons.add, label: "Add to\nInventory"),
                  QuickActionItem(icon: Icons.calendar_today, label: "Schedule\nPickup"),
                  QuickActionItem(icon: Icons.account_balance_wallet, label: "Withdraw\nFunds"),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // =======================
            // MY HIGHLIGHTS
            // =======================
            const Text(
              "My Highlights",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFDCE3C2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "You are the highest resident earner in your neighbourhood this month!",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),

                  const SizedBox(height: 15),

                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2E7C8),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("February’s Earnings"),
                        SizedBox(height: 5),
                        Text(
                          "₦ 31,680",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      HighlightSmallCard(
                        title: "50 kg",
                        subtitle: "Plastic saved",
                      ),
                      HighlightSmallCard(
                        title: "8",
                        subtitle: "Bins recycled",
                      ),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 25),

            // =======================
            // INVENTORY OVERVIEW
            // =======================
            const Text(
              "Inventory Overview",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFDCE3C2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: const [
                  InventoryCard(title: "Plastics", weight: "~3kg"),
                  SizedBox(height: 12),
                  InventoryCard(title: "Paper", weight: "~1kg"),
                  SizedBox(height: 12),
                  InventoryCard(title: "Metals", weight: "~10kg"),
                  SizedBox(height: 12),
                  InventoryCard(title: "Glass", weight: "~1kg"),
                ],
              ),
            ),
          ],
        ),
      ),

      // =======================
      // BOTTOM NAVIGATION
      // =======================
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF4B5D1F),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.inventory), label: "Inventory"),
          BottomNavigationBarItem(icon: Icon(Icons.local_shipping), label: "Pickup"),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "Wallet"),
        ],
      ),
    );
  }
}

// =======================
// QUICK ACTION WIDGET
// =======================
class QuickActionItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const QuickActionItem({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(icon, color: Colors.black54),
        ),
        const SizedBox(height: 6),
        Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

// =======================
// SMALL HIGHLIGHT CARD
// =======================
class HighlightSmallCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const HighlightSmallCard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF2E7C8),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(subtitle, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

// =======================
// INVENTORY CARD
// =======================
class InventoryCard extends StatelessWidget {
  final String title;
  final String weight;

  const InventoryCard({
    super.key,
    required this.title,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F0E3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          Text(weight),
        ],
      ),
    );
  }
}
