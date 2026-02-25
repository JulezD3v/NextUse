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