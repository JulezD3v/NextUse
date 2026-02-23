import 'package:flutter/material.dart';
import 'item_widget/category_widget.dart';
import 'item_widget/grid_tile.dart';
import 'package:nextuse/HomePage/color_palette.dart';
import 'package:nextuse/Core/Constants/Colors/color.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  int selectedIndex = 0;

  final categories = ["All", "Plastic", "Paper", "Metal", "Glass"];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// GRID CONTAINER
        Positioned(
          left: 1,
          right: 1,
          height: 300,
          top: 30,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.only(
              top: 16,
              left: 14,
              right: 14,
            ),
            decoration: BoxDecoration(
              color: Background.containbg,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            child: const ItemsGrid(),
          ),
        ),

        /// CATEGORY TABS
        Positioned(
          top: 0,
          left: 20,
          right: 20,
          child: CategoryTabs(
            categories: categories,
            selectedIndex: selectedIndex,
            onTap: (i) => setState(() => selectedIndex = i),
          ),
        ),
      ],
    );
  }
}