import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextuse/A_Core/widgets/common_container.dart';
import 'package:nextuse/A_Core/widgets/segm_cont.dart';
import 'package:nextuse/HomePage/item_widget/flash_card.dart';
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

class Pickup extends StatefulWidget {
  //final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  const Pickup({super.key});

  @override
  State<Pickup> createState() => _PickupState();
}

class _PickupState extends State<Pickup> {
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
            backgroundColor: Background.mainbg,
            appBar: AppBar(
              backgroundColor:
                  Colors.transparent, // so the pill's background shows
              elevation: 0,
              titleSpacing: 0,
              automaticallyImplyLeading: false, // remove default back arrow

              title: Align(
                alignment: Alignment.centerLeft,
                child: PageHeader(
                  title: "Pick Up", // ← changes per page
                  leadingIcon:
                      Icons.local_shipping_outlined, // ← changes per page
                  onLeadingTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => AppDrawer()),
                    );
                  }, // open menu/drawer
                ),
              ),

              centerTitle: false, // keep it on the left
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
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, HomeLoaded state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: TabContainerCard(
              // Checkout the exp widgets
              primaryTabText: 'Next Pickup',
              secondaryTabText: 'View Cont..',
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  children: [
                    // ── STATUS BANNER (exact match to image) ─────────────────────
                    Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          vertical: 9,
                          horizontal: 15,
                        ),

                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 180, 189, 140),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                          ),
                          border: Border.all(width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Text(
                            'Status: Confirmed',
                            style: TextStyle(
                              fontSize: 13.2,
                              color: Color(0xFF3D3820),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ── CALENDAR + INFO ROW ──────────────────────────────────────
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Calendar card
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Container(
                            width: 122,
                            padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF9E8),
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: const Color(0xFF3D3820),
                                width: 1.5,
                              ),
                            ),
                            child: Column(
                              children: [
                                // Binder holes
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    2,
                                    (_) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Container(
                                        width: 9,
                                        height: 9,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: const Color(0xFF3D3820),
                                            width: 1.5,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'SATURDAY',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF8C8A75),
                                  ),
                                ),
                                Text(
                                  '28',
                                  style: TextStyle(
                                    fontSize: 52,
                                    fontWeight: FontWeight.bold,
                                    height: 0.82,
                                    color: const Color(0xFF3D3820),
                                  ),
                                ),
                                const Text(
                                  'March',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF8C8A75),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(width: 16),

                        // Info column
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.card_giftcard,
                                    size: 26,
                                    color: ButtonCol.btnIcon,
                                  ),
                                  const SizedBox(width: 9),
                                  const Text(
                                    '7,056 EcoPoints',
                                    style: TextStyle(
                                      fontSize: 16.8,
                                      fontWeight: FontWeight.bold,
                                      color: TextCol.gentext,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 19),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.recycling,
                                    size: 26,
                                    color: ButtonCol.btnIcon,
                                  ),
                                  const SizedBox(width: 5),
                                  const Text(
                                    'Plastics',
                                    style: TextStyle(
                                      fontSize: 16.8,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF3D3820),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 19),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    size: 26,
                                    color: ButtonCol.btnIcon,
                                  ),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: Text(
                                      '27 Adeyemi Sreet, Lekki,\nLagos, Nigeria',
                                      style: const TextStyle(
                                        fontSize: 14.5,
                                        height: 1.25,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // ── BUTTONS (exact match to image) ─────────────────────────────
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          // Create Draft
                          Expanded(
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: Background.secbg,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.edit_note,
                                    color: TextCol.txtfield,
                                    size: 22,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Create Draft',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(width: 14),

                          // Request Pickup
                          Expanded(
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE0E0E0),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: Color(0xFF3D3820),
                                    size: 22,
                                  ),
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Quick Actions
          const SizedBox(height: 20),
          SingleChildScrollView(
            child: QuickActionsCard(
              title: "Request Another Pickup",
              height: 320,
              bodyColor: Color(0xFFF5F0DC),
              navbarColor: Color(0xFFF5F0DC),
              navbarTextColor: TextCol.gentext,
              child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    children: [
                      // ── STATUS BANNER (exact match to image) ─────────────────────
                      Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 9,
                            horizontal: 15,
                          ),
            
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(235, 224, 177, 175).withOpacity(0.5),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                            ),
                            border: Border.all(width: 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Text(
                              'Status: Not Eligable, remaining inventory valuebelow 5000EP',
                              style: TextStyle(
                                fontSize: 13.2,
                                color: Color(0xFF3D3820),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
            
                      const SizedBox(height: 20),
            
                      // ── CALENDAR + INFO ROW ──────────────────────────────────────
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Calendar card
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Container(
                              width: 122,
                              padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFF9E8),
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: const Color(0xFF3D3820),
                                  width: 1.5,
                                ),
                              ),
                              child: Column(
                                children: [
                                  // Binder holes
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(
                                      2,
                                      (_) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: Container(
                                          width: 9,
                                          height: 9,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: const Color(0xFF3D3820),
                                              width: 1.5,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'SATURDAY',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF8C8A75),
                                    ),
                                  ),
                                  Text(
                                    '28',
                                    style: TextStyle(
                                      fontSize: 52,
                                      fontWeight: FontWeight.bold,
                                      height: 0.82,
                                      color: const Color(0xFF3D3820),
                                    ),
                                  ),
                                  const Text(
                                    'April',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF8C8A75),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
            
                          const SizedBox(width: 16),
            
                          // Info column
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.card_giftcard,
                                      size: 26,
                                      color: ButtonCol.btnIcon,
                                    ),
                                    const SizedBox(width: 9),
                                    const Text(
                                      '2,294 EcoPoints',
                                      style: TextStyle(
                                        fontSize: 16.8,
                                        fontWeight: FontWeight.bold,
                                        color: TextCol.gentext,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 19),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.recycling,
                                      size: 26,
                                      color: ButtonCol.btnIcon,
                                    ),
                                    const SizedBox(width: 5),
                                    const Text(
                                      'Plastics',
                                      style: TextStyle(
                                        fontSize: 16.8,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF3D3820),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 19),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      size: 26,
                                      color: ButtonCol.btnIcon,
                                    ),
                                    const SizedBox(width: 5),
                                    Expanded(
                                      child: Text(
                                        '27 Adeyemi Sreet, Lekki,\nLagos, Nigeria',
                                        style: const TextStyle(
                                          fontSize: 14.5,
                                          height: 1.25,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
            
                      const SizedBox(height: 10),
            
                      // ── BUTTONS (exact match to image) ─────────────────────────────
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            // Create Draft
                            Expanded(
                              child: Container(
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Background.secbg,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.edit_note,
                                      color: TextCol.txtfield,
                                      size: 22,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'Create Draft',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
            
                            const SizedBox(width: 14),
            
                            // Request Pickup
                            Expanded(
                              child: Container(
                                height: 48,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE0E0E0),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: Color(0xFF3D3820),
                                      size: 22,
                                    ),
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ),
          ),

          const SizedBox(height: 20),

          // My Highlights Card
          NotebookCard(
            title: 'PickUp History',
            height: 230,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FlatCard(
                    color: ButtonCol.newbtn.withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Pick up complete"),
                    ),
                  ),
                  const SizedBox(height: 5),
                  FlatCard(
                    color: Background.secbg.withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Pick up confirmed"),
                    ),
                  ),
                  const SizedBox(height: 5),

                  FlatCard(
                    color: const Color.fromARGB(
                      255,
                      226,
                      212,
                      174,
                    ).withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Pick in request"),
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // With your own child
        ],
      ),
    );
  }
}
