import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Core/Constants/Colors/color.dart';
import './Data/bloc/home_bloc.dart';
import './Data/repo/mock_home_repo.dart';
import '../../../HomePage/widgets/action_btn.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(MockHomeRepository())..add(FetchHomeHighlights()),
      child: Scaffold(
        backgroundColor: Background.mainbg,
        appBar: AppBar(
          title: const Text(
            "NextUse",
            style: TextStyle(color: TextCol.gentext, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Background.containbg,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu, color: TextCol.gentext),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_outlined, color: TextCol.gentext),
              onPressed: () {},
            ),
          ],
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator(color: ButtonCol.mybtn));
            }
            if (state is HomeError) {
              return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
            }
            if (state is HomeLoaded) {
              return _buildContent(context, state);
            }
            return const SizedBox();
          },
        ),
        bottomNavigationBar: _buildBottomNav(),
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

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      backgroundColor: Background.containbg,
      selectedItemColor: ButtonCol.mybtn,
      unselectedItemColor: TextCol.gentext.withOpacity(0.6),
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.inventory_2_outlined), label: "Inventory"),
        BottomNavigationBarItem(icon: Icon(Icons.local_shipping_outlined), label: "Pickup"),
        BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_outlined), label: "Wallet"),
      ],
      currentIndex: 0,
      onTap: (index) {
        // TODO: GoRouter later
      },
    );
  }
}