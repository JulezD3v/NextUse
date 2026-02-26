import 'package:flutter/material.dart';
import 'item_widget/category_widget.dart';
import 'item_widget/grid_tile.dart';
import 'package:nextuse/HomePage/color_palette.dart';
import 'package:nextuse/Core/Constants/Colors/color.dart';

class HomeContent extends StatefulWidget {
  final List<String>? categories;
  final List<GridItem>? items;
  final double gridHeight;
  final ValueChanged<int>? onCategoryTap;
  final ValueChanged<GridItem>? onItemTap;

  const HomeContent({
    this.items,
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
  bool isLoading = true;
  List<GridItem> items = [];

  List<String> get _categories =>
      widget.categories ?? ["All", "Plastic", "Paper", "Metal", "Glass"];

  @override
  void initState() {
    super.initState();
    _fetchItems();
  }

  Future<void> _fetchItems() async {
    setState(() => isLoading = true);
    try {
      await Future.delayed(const Duration(milliseconds: 500)); // replace with real call
      final result = <GridItem>[];
      if (mounted) setState(() { items = result; isLoading = false; });
    } catch (e) {
      if (mounted) setState(() => isLoading = false);
      debugPrint('HomeContent fetch error: $e');
    }
  }

  void _onCategoryTap(int index) {
    setState(() => selectedIndex = index);
    widget.onCategoryTap?.call(index);
    _fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Column(                          // ← No more Stack/Positioned
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// CATEGORY TABS (sits naturally above the grid)
        Padding(
          //padding: const EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.zero,
          child: CategoryTabs(
            categories: _categories,
            selectedIndex: selectedIndex,
            onTap: _onCategoryTap,
          ),
        ),

        /// GRID CONTAINER
        Container(
          height: widget.gridHeight,
          //margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.only(top: 16, left: 14, right: 14),
          decoration: BoxDecoration(
            color: Background.containbg,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : ItemsGrid(
                 items:items,
                  onItemTap: widget.onItemTap,
                ),
        ),
      ],
    );
  }
}