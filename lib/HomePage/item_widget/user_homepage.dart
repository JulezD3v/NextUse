import 'package:flutter/material.dart';
import './category_widget.dart';
import './grid_tile.dart';
import 'package:nextuse/HomePage/color_palette.dart';



class UserHomepage extends StatefulWidget {
  const UserHomepage({super.key});

  @override
  State<UserHomepage> createState() => _UserHomepageState();
}

class _UserHomepageState extends State<UserHomepage> {
int selectedIndex = 0;

  final categories = ["All", "Plastic", "Paper", "Metal", "Glass"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.border,

      body: SafeArea(
        child: Stack(
          children: [

            /// GRID CONTAINER
            Positioned.fill(
              top: 45, // space reserved for tabs
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.only(
                  top: 30, // padding so grid doesn’t touch tabs
                  left: 12,
                  right: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.container,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.border),

                ),
                child: const ItemsGrid(),
              ),
            ),

            /// CATEGORY TABS
            Positioned(
              top: 0,
              left: 16,
              right: 16,
              child: CategoryTabs(
                categories: categories,
                selectedIndex: selectedIndex,
                onTap: (i) => setState(() => selectedIndex = i),
              ),
            ),
          ],
        ),
      ),
    );
  }
}