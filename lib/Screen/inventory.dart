import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextuse/Account%20and%20Profile/Widgets/button_widget.dart';
import 'package:nextuse/Core/widgets/common_container.dart';
import 'package:nextuse/Core/widgets/segm_cont.dart';
import 'package:nextuse/HomePage/item_widget/grid_tile.dart';
import 'package:nextuse/HomePage/home_content.dart';
import 'package:nextuse/HomePage/item_widget/itemgrid_widget.dart';
import '/Core/route/bottom_route.dart';
import '../../../Core/Constants/Colors/color.dart';
import '../../../Core/widgets/button.dart';
import '../../../Core/widgets/notebook.dart';
import '../HomePage/widgets/action_card.dart';
import '../../../Core/widgets/bottom_nav.dart';
import '../HomePage/widgets/notebook_card.dart';

class Inventory extends StatefulWidget {
  const Inventory({super.key});

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  // This controls which tab is active
  //int _selectedIndex = 0;

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
        backgroundColor: Colors.transparent, // so the pill's background shows
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false, // remove default back arrow

        title: Align(
          alignment: Alignment.centerLeft,
          child: PageHeader(
            title: "Inventory", // ← changes per page
            leadingIcon: Icons.inventory_outlined, // ← changes per page
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
     

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top:10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15),
                child: NotebookCard(
                  title: 'Inventory Value',
                  height: 170,
                  child: Column(
                    children: [
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
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "-7,055",
                              style: TextStyle(
                                color: Color(0xFF7F903C),
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "EP (Upcoming Pickup)",
                            style: TextStyle(
                              color: Color(0xFF7F903C),
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8,),
                      Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "View details",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF6B8F5E),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Reschedule",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF6B8F5E),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                      ),
                    ],
                  ),
                ),
              ),
        
              const SizedBox(height: 20),

              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: HomeContent(
                  gridHeight: 300,
                  onItemTap: (item) => print("Tapped: ${item.title}"),
                  // ← NO items list needed anymore!
                  
                ), 
              ),
              const SizedBox(height: 25,),

              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: PrimaryButton(text:"Log Item", 
                colors: const Color.fromARGB(255, 141, 148, 109),
                txtcolors: TextCol.gentext,),
              ),
               const SizedBox(height:15),

               Padding(
                 padding: const EdgeInsets.only(right: 15, left: 15),
                 child: GestureDetector(
                       onTap:(){},
                       child: Container(
                         width: double.infinity,
                         height: 50,
                         decoration: ShapeDecoration(
                           color: ButtonCol.newbtn,
                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                           
                         ),
                         
                         child: Center(
                           child: Text(
                             "View Recyclables library",
                             style: TextStyle(
                               color:  TextCol.gentext,
                               fontSize: 16,
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
      ),
    );
  }
}
