import 'package:flutter/material.dart';
import './itemgrid_widget.dart';

class GridItem {
  final String title;
  final int count;
  final IconData? icon;
  final String category;
  final String? imagePath;

  const GridItem({
    required this.title,
    required this.count,
    this.icon,
    required this.category,
    this.imagePath,
  });
}

class ItemsGrid extends StatelessWidget {
  final List<GridItem> items;
  final ValueChanged<GridItem>? onItemTap;
  final int crossAxisCount;
  final double childAspectRatio;

  const ItemsGrid({
    super.key,
    required this.items,
    this.onItemTap,
    this.crossAxisCount = 3,
    this.childAspectRatio = 0.8,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: items.length, // ← fixed hardcoded 12
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return GestureDetector(
          onTap: () => onItemTap?.call(item),
          child: ItemCard(
            title: item.title,
            count: item.count,
            icon: item.icon,
          ),
        );
      },
    );
  }
}