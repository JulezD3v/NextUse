import 'package:flutter/material.dart';
import 'item_widget/category_widget.dart';
import 'item_widget/grid_tile.dart';
import 'package:nextuse/HomePage/color_palette.dart';
import 'package:nextuse/Core/Constants/Colors/color.dart';

class HomeContent extends StatefulWidget {
  final List<String>? categories;
  final double gridHeight;
  final ValueChanged<int>? onCategoryTap;
  final ValueChanged<GridItem>? onItemTap;

  const HomeContent({
    super.key,
    this.categories,
    this.gridHeight = 300,
    this.onCategoryTap,
    this.onItemTap,
  });

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  int selectedIndex = 0;
  bool isLoading = false;

  // ← ALL ITEMS LIVE HERE NOW (you add/edit here)
  final List<GridItem> allItems = [
    // Plastic
    GridItem(title: "1L PET Bottle", count: 36, icon: Icons.local_drink, category: "Plastic", ),
    GridItem(title: "500ml PET Bot...", count: 14, icon: Icons.local_drink, category: "Plastic",),
    GridItem(title: "2L HDPE Bottle", count: 3, icon: Icons.local_drink, category: "Plastic"),
    GridItem(title: "2L PET Bottle", count: 11, icon: Icons.local_drink, category: "Plastic"),
    GridItem(title: "330ml PET Bot...", count: 14, icon: Icons.local_drink, category: "Plastic"),
    // Paper
    GridItem(title: "1L Carton", count: 6, icon: Icons.inventory_2, category: "Paper"),
    GridItem(title: "30 Egg Carton", count: 12, icon: Icons.egg, category: "Paper"),
    GridItem(title: "Large Cardboard", count: 7, icon: Icons.inventory_2, category: "Paper"),
    // Metal
    GridItem(title: "330ml Metal D...", count: 24, icon: Icons.delete_outline, category: "Metal"),
    GridItem(title: "170g Metal C...", count: 5, icon: Icons.delete_outline, category: "Metal"),
    // Glass
    GridItem(title: "Wine Bottle", count: 8, icon: Icons.wine_bar, category: "Glass"),
    GridItem(title: "1L Glass Bottle", count: 9, icon: Icons.wine_bar, category: "Glass"),
    GridItem(title: "Glass Jar", count: 5, icon: Icons.wine_bar, category: "Glass"),
    GridItem(title: "Glass Cup", count: 12, icon: Icons.wine_bar, category: "Glass"),
  ];

  List<GridItem> displayedItems = [];

  List<String> get _categories =>
      widget.categories ?? ["All", "Plastic", "Paper", "Metal", "Glass"];

  @override
  void initState() {
    super.initState();
    displayedItems = allItems;
    isLoading = false;
  }

  void _onCategoryTap(int index) {
    setState(() {
      selectedIndex = index;
      final selectedCategory = _categories[index];

      if (selectedCategory == "All") {
        displayedItems = allItems;
      } else {
        displayedItems = allItems.where((item) => item.category == selectedCategory).toList();
      }
    });
    widget.onCategoryTap?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.zero,
          child: CategoryTabs(
            categories: _categories,
            selectedIndex: selectedIndex,
            onTap: _onCategoryTap,
          ),
        ),

        Container(
          height: widget.gridHeight,
          padding: const EdgeInsets.only(top: 16, left: 14, right: 14),
          decoration: BoxDecoration(
            color: Background.containbg,
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : ItemsGrid(
                  items: displayedItems,
                  onItemTap: widget.onItemTap,
                ),
        ),
      ],
    );
  }
}