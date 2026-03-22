import 'package:flutter/material.dart';
import '/HomePage/item_widget/grid_tile.dart';

final List<GridItem> allItems = [
  // Plastic
  GridItem(title: "1L PET Bottle", count: 36, imagePath:'assets/Images/Inventory Items/1l PET-1.png', category: "Plastic"),
  GridItem(title: "500ml PET Bot...", count: 14, imagePath: 'assets/Images/Inventory Items/500ml PET.png', category: "Plastic"),
  GridItem(title: "2L HDPE Bottle", count: 3, imagePath: 'assets/Images/Inventory Items/2l PET.png', category: "Plastic"),
  GridItem(title: "2L PET Bottle", count: 11, imagePath: 'assets/Images/Inventory Items/2l HDPE.png', category: "Plastic"),
  GridItem(title: "330ml PET Bot...", count: 14, imagePath: 'assets/Images/Inventory Items/330ml PET.png', category: "Plastic"),

  // Paper
  GridItem(title: "1L Carton", count: 6, icon: Icons.inventory_2, category: "Paper"),
  GridItem(title: "30 Egg Carton", count: 12, icon: Icons.egg, category: "Paper"),
  GridItem(title: "Large Cardboard", count: 7, icon: Icons.inventory_2, category: "Paper"),

  // Metal
  GridItem(title: "330ml Metal D...", count: 24, imagePath: 'assets/Images/Categories/Metal.png', category: "Metal"),
  GridItem(title: "170g Metal C...", count: 5, imagePath: 'assets/Images/Categories/Metal.png', category: "Metal"),

  // Glass
  GridItem(title: "Wine Bottle", count: 8, icon: Icons.wine_bar, category: "Glass"),
  GridItem(title: "1L Glass Bottle", count: 9, icon: Icons.wine_bar, category: "Glass"),
  GridItem(title: "Glass Jar", count: 5, icon: Icons.wine_bar, category: "Glass"),
  GridItem(title: "Glass Cup", count: 12, icon: Icons.wine_bar, category: "Glass"),
];