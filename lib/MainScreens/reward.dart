import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextuse/A_Core/widgets/common_container.dart';
import 'package:nextuse/A_Core/widgets/segm_cont.dart';
import 'package:nextuse/HomePage/item_widget/grid_tile.dart';
//import 'package:nextuse/HomePage/home_content.dart';
import '../A_Core/route/bottom_route.dart';
import '../A_Core/Constants/Colors/color.dart';
import '../A_Core/widgets/button.dart';
import '../A_Core/widgets/notebook.dart';
import '../HomePage/widgets/action_card.dart';
import '../A_Core/widgets/bottom_nav.dart';
import '../A_Core/widgets/menu_drawer.dart';
import '../HomePage/widgets/notebook_card.dart';
import '../HomePage/Data/bloc/home_bloc.dart';
import '../HomePage/Data/repo/mock_home_repo.dart';
import '../../../HomePage/exp_widgets/sectionCard.dart';
import 'package:nextuse/HomePage/item_widget/flash_card.dart';

class Reward extends StatefulWidget {
  //final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
   const Reward({super.key});

  @override
  State<Reward> createState() => _RewardState();
}

class _RewardState extends State<Reward> {
   // This controls which tab is active
  //int _selectedIndex = 0;
  


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(MockHomeRepository())..add(FetchHomeHighlights()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            drawer: AppDrawer(
              
              name: 'Florence Okoye',
              image: AssetImage('assets/images/profile.jpg'), // or NetworkImage(url)
              width: 45,
              onEditProfile: () {},
              onSettings: () {},//=> Navigator.pushNamed(context, '/settings'),
              onSupport: () {},//=> Navigator.pushNamed(context, '/support'),
              onPrivacyAbout: (){},// => Navigator.pushNamed(context, '/privacy'),
            ),
            backgroundColor: Background.mainbg,
            appBar: AppBar(
              backgroundColor: Colors.transparent, // so the pill's background shows
              elevation: 0,
              titleSpacing: 0,
              automaticallyImplyLeading: false, // remove default back arrow
              
              title:  Align(
                    alignment: Alignment.centerLeft,
                    child: PageHeader(
                      title: "Reward Hub", // ← changes per page
                      leadingIcon: Icons.card_giftcard_outlined, // ← changes per page
                       onLeadingTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> AppDrawer()));
                       }// open menu/drawer
                    ),
                  ),
               
              centerTitle: false, // keep it on the left
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.notifications_outlined,
                    color: TextCol.gentext,
                  ),
                  onPressed: () {},
                ),
                const SizedBox(width: 8),
              ],
            ),
            body: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const Center(
                    child: CircularProgressIndicator(color: ButtonCol.mybtn),
                  );
                }
                if (state is HomeError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }
                if (state is HomeLoaded) {
                  return _buildContent(context, state);
                }
                return const SizedBox();
              },
            ),
            bottomNavigationBar: CustomNavBar(
            selectedIndex: 0,
            onTap: (index) {
              navigate(context, index);
            },
          ),
          );
        }
      ),
    );
  }

  Widget _buildContent(BuildContext context, HomeLoaded state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

           QuickActionsCard(
            title:"Available Rewards",
            navbarTextColor: TextCol.gentext,
            height: 145, 
            child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "47,285",
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
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "+7,285",
                                style: TextStyle(
                                  color: Color(0xFF7F903C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "EP (Pending)",
                              style: TextStyle(
                                color: Color(0xFF7F903C),
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Padding(
                                       padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
                                       child: GestureDetector(
                        onTap:(){},
                        child: Container(
                          width: double.infinity,
                          height: 45,
                          decoration: ShapeDecoration(
                            color: ButtonCol.newbtn. withOpacity(0.5),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),),
                            
                          ),
                          
                          child: Center(
                            child: Text(
                              "View Recyclables library",
                              style: TextStyle(
                                color:  TextCol.gentext,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                                     ),
                    ],
                  ),
                      
            
          ),

          const SizedBox(height: 20),
          const SizedBox(height: 24,),
            NotebookCard(
            title: 'PickUp History',
            height: 230,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FlatCard(
                    color: const Color.fromARGB(255, 247, 248, 168).withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("8,904  pending"),
                    ),
                  ),
                  const SizedBox(height: 5),
                  FlatCard(
                    color: Background.secbg.withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("5,684 received"),
                    ),
                  ),
                  const SizedBox(height: 5),

                  FlatCard(
                    color: const Color.fromARGB(255, 247, 248, 168).withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("4,000  pending"),
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24,),
          // Quick Actions

          const SizedBox(height: 20),
          QuickActionsCard(
            title:"Available Rewards",
            navbarTextColor: TextCol.gentext,
            height: 130,
            actions: [
              QuickActionItem(
                icon: Icons.phone,
                label: "Airtime\n(Min 1k EP)",
                onTap: () {},
              ),
              QuickActionItem(
                icon: Icons.public,
                label: "Data\n(Min 1k EP))",
                onTap: () {},
              ),
              QuickActionItem(
                icon: Icons.card_giftcard_outlined,
                label: "Electricity\n(Min 5K EP)",
                onTap: () {},
              ),
            ],
          ),

          const SizedBox(height: 20),

          // My Highlights Card
          NotebookCard(
            title: 'My Highlights',
            actionLabel: 'See more',
            onActionTap: () {},
            height: 450,
            child: MyHighlightsContent(
              earningsAmount: state.highlight.earnings.toStringAsFixed(0),
              plasticKg: '${state.highlight.totalPlasticKg} kg',
              binCount: state
                  .highlight
                  .cansRecycled, // ← drives bin icons automatically
              onViewWallet: () {},
            ),
          ),

          const SizedBox(height: 20),

          // With your own child
        ],
      ),
    );
  }
}
