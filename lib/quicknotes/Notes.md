  import
  const SizedBox(height: 24),

          ReminderCard(
            message: "Your next pickup is scheduled for Saturday 14 March",
            height: 130, // holes auto-scale with height
            onViewDetails: () {},
            onReschedule: () {},
          ),

          const SizedBox(height: 20),
          QuickActionsCard(
            height: 150,
            actions: [
              QuickActionItem(
                icon: Icons.add_circle_outline,
                label: "Add to\ninventory",
                onTap: () {},
              ),
              QuickActionItem(
                icon: Icons.calendar_today_outlined,
                label: "Schedule\npickup",
                onTap: () {},
              ),
              QuickActionItem(
                icon: Icons.card_giftcard_outlined,
                label: "Redeem\nrewards",
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 20),

  ##    Notebook_card explanation ==> incase I want to add whatever I want to add
  NotebookCard(
  title: 'My Schedule',
  actionLabel: 'View all',
  child: YourOtherWidget(), // ← swap child, holes + title row stay the same
)


## Section.dart APPLICATION
// Default text, empty body
TabContainerCard()

// Custom text only
TabContainerCard(
  primaryTabText: 'My Inventory',
  secondaryTabText: 'Step 2 of 3',
)

// With your own child
TabContainerCard(
  primaryTabText: 'Add Items',
  secondaryTabText: 'Step 1 of 3',
  child: YourWidget(),
)

// With a grid
TabContainerCard(
  primaryTabText: 'Inventory',
  secondaryTabText: 'Step 1 of 3',
  child: ItemsGrid(items: items),
)

## Note to self and others
 ItemsGrid uses GridView.builder which needs a bounded height to lay itself out, but it's inside an unbounded column. Fix it by wrapping it in an *Expanded* or a *SizedBox* with a fixed height:


 // ── In your existing Pickup page (the one with HomeBloc) ──────

// STEP 1: Add this import at the top
import 'package:nextuse/SubScreens/Pickup/select_date_time_page.dart';
import 'package:nextuse/SubScreens/Pickup/request_pickup_page.dart';
import 'package:nextuse/HomePage/item_widget/grid_tile.dart';


// STEP 2: Find the "Request Pickup" Container button (there are TWO — 
// one in TabContainerCard and one in QuickActionsCard).
// Wrap BOTH in a GestureDetector like this:

// ── First one (Next Pickup card) ─────────────────────────────
GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SelectDateTimePage(
          // Pass your actual inventory items here
          // These come from your HomeLoaded state or repository
          pickupItems: state.inventoryItems.map((item) =>
            PickupItem(item: item, quantity: item.count)
          ).toList(),
        ),
      ),
    );
  },
  child: Expanded(
    child: Container(
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFE0E0E0),
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, color: Color(0xFF3D3820), size: 22),
          SizedBox(width: 8),
          Text(
            'Request Pickup',
            style: TextStyle(
              color: Color(0xFF3D3820),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    ),
  ),
),

// ── Second one (Request Another Pickup card) ──────────────────
// Same GestureDetector wrapper, same navigation
// The "Status: Not Eligible" card should disable the button:

GestureDetector(
  onTap: null, // disabled — inventory value below 5000 EP threshold
  child: Expanded(
    child: Container(
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFE0E0E0).withOpacity(0.5), // greyed out
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, color: Color(0xFF9D9D9D), size: 22),
          SizedBox(width: 8),
          Text(
            'Request Pickup',
            style: TextStyle(
              color: Color(0xFF9D9D9D),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    ),
  ),
),