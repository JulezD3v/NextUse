import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nextuse/A_Core/widgets/sectionCard.dart';
import 'package:nextuse/MainScreens/inventory.dart';
import './widget/top_nav.dart';
import '/A_Core/Constants/Colors/color.dart';
import '/A_Core/widgets/bottom_nav.dart';
import '/A_Core/route/bottom_route.dart';
import './widget/items_db.dart';
import '/HomePage/item_widget/itemgrid_widget.dart';
import '/HomePage/item_widget/grid_tile.dart';

class LogItem extends StatefulWidget {
  const LogItem({super.key});

  @override
  State<LogItem> createState() => _LogItemState();
}

class _LogItemState extends State<LogItem> {
  GridItem? selectedItem;
  List<GridItem> filteredItems = [];

void onSearch(String query) {
  setState(() {
    hasSearched = query.isNotEmpty;
    filteredItems = allItems
        .where((item) =>
            item.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  });
}
bool hasSearched = false;
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,

        title: Align(
          alignment: Alignment.centerLeft,
          child: TopBar(
            title: 'Log Item',
            icon: Icons.arrow_back,
            onIconPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (_) => const Inventory()),
              );
            },
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),

        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
  child: TabContainerCard(
    primaryTabText: "Find your item",
    secondaryTabText: " Step 1 of 3 ",
    containerHeight: hasSearched && filteredItems.isNotEmpty ? 400 : 180,
  
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        children: [
  
          // 🔍 Search field
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFE0DED7),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFB8AE8B)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
             
              child: TextField(
                onChanged: onSearch,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    color: const Color(0xFF8A7F5A),
                  ),
                  hintText: "Search",
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 14,
                  ),
  
                  // 👇 right icon
                ),
              ),
           
            ),
          ),
  
          const SizedBox(height: 5),
  
          // 🔘 Disabled button
         
      if (selectedItem == null)
        Expanded(
  child: filteredItems.isEmpty && hasSearched
      ? const Center(child: Text("No items found"))
      : GridView.builder(
          itemCount: filteredItems.length,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            final item = filteredItems[index];
  
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedItem = item;
                });
              },
              child: ItemCard(
                title: item.title,
                count: item.count,
                image: item.imagePath,
                icon: item.icon,
              ),
            );
          },
        ),
        )
          else
            Expanded(
              child: Center(
                child: ItemCard(
                  title: selectedItem!.title,
                  count: selectedItem!.count,
                  image: selectedItem!.imagePath,
                  icon: selectedItem!.icon,
                ),
              ),
            ),
  
          const SizedBox(height: 5),
  
          if (selectedItem == null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.grey),
              ),
              alignment: Alignment.center,
              child: Text(
                "Select an item to continue",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          else
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        selectedItem = null;
                      });
                    },
                    child: const Text("Reselect"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Continue"),
                  ),
                ),
              ],
            ),
        ],
      ),
    ),
  ),
      ),
      ),
    );
  }
}
