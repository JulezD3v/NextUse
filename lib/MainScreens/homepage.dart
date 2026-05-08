import 'package:flutter/material.dart';

//Working progress
//import 'package:flutter_bloc/flutter_bloc.dart';

//import 'package:nextuse/A_Core/widgets/segm_cont.dart';
import 'package:nextuse/Ecobot/ecobot.dart';
import 'package:nextuse/HomePage/item_widget/grid_tile.dart';
import 'hamburger.dart';
import '/SubScreens/Inventory/log_item.dart';
import '../SubScreens/Inventory/Library/date_time.dart';
import 'pickup.dart';

//import 'package:nextuse/HomePage/home_content.dart';
import '../A_Core/route/bottom_route.dart';
import '../A_Core/Constants/Colors/color.dart';

//Feature Widgets
import '../A_Core/widgets/topnav_btn.dart';
import '../A_Core/widgets/notebook.dart';
import '../HomePage/widgets/action_card.dart';
import '../A_Core/widgets/bottom_nav.dart';
import '../A_Core/widgets/menu_drawer.dart';
import '../HomePage/widgets/notebook_card.dart';
import '../A_Core/widgets/sectionCard.dart';
import 'package:nextuse/A_Core/widgets/common_container.dart';

//Bloc Still working on the bloc
//import '../HomePage/Data/bloc/home_bloc.dart';
//import '../HomePage/Data/repo/mock_home_repo.dart';


class HomePage extends StatefulWidget {
  //final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // This controls which tab is active

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Background.mainbg,
      bottomNavigationBar: CustomNavBar(
        selectedIndex: 0,
        onTap: (index) {
          navigate(context, index);
        },
      ),
       appBar: AppBar(
            backgroundColor:
                Colors.transparent, // so the pill's background shows
            elevation: 0,
            titleSpacing: 0,
            automaticallyImplyLeading: false, // remove default back arrow
    
            title: Align(
              alignment: Alignment.centerLeft,
              child: PageHeader(
                title: "NextUse", // ← changes per page
                leadingIcon: Icons.menu, // ← changes per page
                onLeadingTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => AppDrawer()),
                  );
                }, // open menu/drawer
              ),
            ),
    
            centerTitle: false, // keep it on the left
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.chat_bubble,
                  color: TextCol.gentext,
                ),
                onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder:(_) => Ecobot()));
                },
              ),
              const SizedBox(width: 8),
            ],
          ),
          
          drawer: AppDrawer(
            name: 'Florence Okoye',
            image: AssetImage(
              'assets/images/profile.jpg',
            ), // or NetworkImage(url)
            width: 45,
            onEditProfile: () {},
            onSettings: () {}, //=> Navigator.pushNamed(context, '/settings'),
            onSupport: () {}, //=> Navigator.pushNamed(context, '/support'),
            onPrivacyAbout:
                () {}, // => Navigator.pushNamed(context, '/privacy'),
          ),
          
          
          body:  SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReminderCard(
            message: "Your next pickup is scheduled for Saturday 14 March",
            height: 130, // holes auto-scale with height
            onViewDetails: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => Pickup()),
              );
            },
            onReschedule: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SelectDateTimePage(
                    pickupItems:
                        [], // items are loaded inside RequestPickupPage from recy_lib
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 24),

          // Quick Actions
          const SizedBox(height: 20),
          QuickActionsCard(
            height: 130,
            navbarTextColor: TextCol.gentext,
            navbarColor: Background.action,
            bodyColor: Background.action,
            actions: [
              QuickActionItem(
                icon: Icons.add_circle_outline,
                label: "Add to\ninventory",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => LogItem()),
                  );
                },
              ),
              QuickActionItem(
                icon: Icons.calendar_today_outlined,
                label: "Schedule\npickup",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SelectDateTimePage(
                        pickupItems:
                            [], // items are loaded inside RequestPickupPage from recy_lib
                      ),
                    ),
                  );
                },
              ),
              QuickActionItem(
                icon: Icons.card_giftcard_outlined,
                label: "Redeem\nrewards",
                onTap: () {},
              ),
            ],
          ),

          const SizedBox(height: 20),

          // My Highlights Card
          NotebookCard(
            backgroundColor: Background.containbg,
            title: 'My Highlights',
            actionLabel: 'See more',
            onActionTap: () {},
            height: 450,
            child: MyHighlightsContent(
              onViewWallet: () {},
            ),
          ),

          const SizedBox(height: 20),

          // With your own child
          TabContainerCard(
            // Checkout the exp widgets
            primaryTabText: 'Add Items',
            secondaryTabText: 'Step 1 of 3',
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  HighlightCard(
                    width: 305.08,
                    height: 96,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Estimated Value",
                            style: TextStyle(
                              color: Color(0xFF655D3E),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),

                        Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "9,350",
                                style: TextStyle(
                                  color: Color(0xFF7F903C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "EcoPoints",
                              style: TextStyle(
                                color: Color(0xFF7F903C),
                                fontWeight: FontWeight.w200,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ItemsGrid(
                      items: [
                        GridItem(
                          title: "1L PET Bottle",
                          count: 36,
                          icon: Icons.local_drink,
                          category: "Plastic",
                        ),
                        GridItem(
                          title: "500ml PET Bot...",
                          count: 14,
                          icon: Icons.local_drink,
                          category: "Plastic",
                        ),
                        GridItem(
                          title: "2L HDPE Bottle",
                          count: 3,
                          icon: Icons.local_drink,
                          category: "Plastic",
                        ),
                        GridItem(
                          title: "2L PET Bottle",
                          count: 11,
                          icon: Icons.local_drink,
                          category: "Plastic",
                        ),
                        GridItem(
                          title: "330ml PET Bot...",
                          count: 14,
                          icon: Icons.local_drink,
                          category: "Plastic",
                        ),
                        // Paper
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
        );
  }
}
