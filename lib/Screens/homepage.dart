import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:nextuse/HomePage/home_content.dart';
import '/Core/route/bottom_route.dart';
import '../../../Core/Constants/Colors/color.dart';
import '../../../Core/widgets/button.dart';
import '../../../Core/widgets/notebook.dart';
import '../HomePage/widgets/action_card.dart';
import '../../../Core/widgets/bottom_nav.dart';
import '../HomePage/widgets/notebook_card.dart';
import '../HomePage/Data/bloc/home_bloc.dart';
import '../HomePage/Data/repo/mock_home_repo.dart';
//import '../../../HomePage/widgets/action_btn.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   // This controls which tab is active
  //int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(MockHomeRepository())..add(FetchHomeHighlights()),
      child: Scaffold(
        backgroundColor: Background.mainbg,
        appBar: AppBar(
          backgroundColor: Colors.transparent, // so the pill's background shows
          elevation: 0,
          titleSpacing: 0,
          automaticallyImplyLeading: false, // remove default back arrow
          title: 
          Align(
            alignment: Alignment.centerLeft,
            child: PageHeader(
              title: "NextUse", // ← changes per page
              leadingIcon: Icons.menu, // ← changes per page
              onLeadingTap: () {}, // open menu/drawer
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
        selectedIndex: 1,
        onTap: (index) {
          navigate(context, index);
        },
      ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, HomeLoaded state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReminderCard(
            message: "Your next pickup is scheduled for Saturday 14 March",
            height: 130, // holes auto-scale with height
            onViewDetails: () {},
            onReschedule: () {},
          ),

          const SizedBox(height: 24,),
          // Quick Actions

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
        ], // children ending
      ),
    );
  }
}