import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextuse/HomePage/home_content.dart';
import '/Core/route/bottom_route.dart';
import 'package:nextuse/Core/widgets/bottom_nav.dart';
import '../../../Core/Constants/Colors/color.dart';
import '../../../Core/widgets/button.dart';
import '../../../Core/widgets/segm_cont.dart';
import '../HomePage/Data/bloc/home_bloc.dart';
import '../HomePage/Data/repo/mock_home_repo.dart';
import '../../../HomePage/widgets/action_btn.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   // This controls which tab is active
  int _selectedIndex = 0;


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
          // Quick Actions
          Text(
            "Quick Actions",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: TextCol.gentext),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              QuickActionButton(
                icon: Icons.add_circle_outline,
                label: "Add to inventory",
                bgColor: Background.secbg,
                iconColor: ButtonCol.btnIcon,
                onTap: () {},
              ),
              QuickActionButton(
                icon: Icons.calendar_today,
                label: "Schedule Pickup",
                bgColor: Background.secbg,
                iconColor: ButtonCol.btnIcon,
                onTap: () {},
              ),
              QuickActionButton(
                icon: Icons.account_balance_wallet_outlined,
                label: "Withdraw funds",
                bgColor: Background.secbg,
                iconColor: ButtonCol.btnIcon,
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 24),
          

          const SizedBox(height: 20,),
          // My Highlights Card
          Card(
            color: Background.containbg,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.highlight.title,
                    style: TextStyle(fontWeight: FontWeight.bold, color: TextCol.gentext),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    state.highlight.period,
                    style: TextStyle(color: TextCol.txtcol, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "₦${state.highlight.earnings.toStringAsFixed(0)}",
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: TextCol.txtcol),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {},
                    child: Text("View wallet", style: TextStyle(color: ButtonCol.mybtn)),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatColumn(Icons.recycling, "${state.highlight.totalPlasticKg} kg", "All the plastic you saved"),
                      _buildStatColumn(Icons.delete_outline, "${state.highlight.cansRecycled} bins", "filled with cans you've recycled"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: ButtonCol.btnHi, size: 36),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        SizedBox(
          width: 100,
          child: Text(label, textAlign: TextAlign.center, style: TextStyle(color: TextCol.gentext, fontSize: 12)),
        ),
      ],
    );
  }
}