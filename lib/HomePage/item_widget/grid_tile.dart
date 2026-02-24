import 'package:flutter/material.dart';
import './itemgrid_widget.dart';

class ItemsGrid extends StatelessWidget {
  final List<dynamic> items;                // Replace dynamic with your item model
  final ValueChanged<dynamic>? onItemTap;  // Replace dynamic with your item model

  const ItemsGrid({
    super.key,
    required this.items,
    this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 12,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) { //==> will be changed
        return const ItemCard(
          title: "1L PET Bottle",
          count: 36,
        );
      },
    );
  }
}
