// import 'package:flutter/material.dart';
// import '/Core/theme/app_theme.dart';   // your color classes
// import '../Constants/Colors/color.dart';

// final ThemeData appTheme = ThemeData(
//   useMaterial3: true,
//   brightness: Brightness.light,

//   // Core colors from YOUR classes
//   scaffoldBackgroundColor: Background.mainbg,
//   primaryColor: ButtonCol.mybtn,
//   colorScheme: ColorScheme.light(
//     primary: ButtonCol.mybtn,
//     onPrimary: Colors.white,
//     secondary: TextCol.txtcol,
//     surface: Background.containbg,
//     onSurface: TextCol.gentext,
//     background: Background.mainbg,
//     onBackground: TextCol.gentext,
//   ),

//   // AppBar
//   appBarTheme: AppBarTheme(
//     backgroundColor: Background.containbg,
//     elevation: 0,
//     centerTitle: false,
//     titleTextStyle: const TextStyle(
//       fontSize: 20,
//       fontWeight: FontWeight.bold,
//       color: TextCol.gentext,
//     ),
//     iconTheme: const IconThemeData(color: TextCol.gentext),
//   ),

//   // Cards (used in Highlights, Quick Actions, Inventory grid)
//   cardTheme: CardTheme(
//     color: Background.containbg,
//     elevation: 2,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(16),
//       side: const BorderSide(color: Background.gridbg, width: 1),
//     ),
//     margin: const EdgeInsets.symmetric(vertical: 8),
//   ),

//   // Text styles
//   textTheme: TextTheme(
//     headlineMedium: const TextStyle(
//       fontSize: 24,
//       fontWeight: FontWeight.bold,
//       color: TextCol.gentext,
//     ),
//     titleLarge: const TextStyle(
//       fontSize: 18,
//       fontWeight: FontWeight.bold,
//       color: TextCol.gentext,
//     ),
//     bodyLarge: TextStyle(
//       fontSize: 16,
//       color: TextCol.gentext,
//     ),
//     bodyMedium: TextStyle(
//       fontSize: 14,
//       color: TextCol.caltext,
//     ),
//     labelLarge: TextStyle(                  // buttons
//       fontSize: 16,
//       fontWeight: FontWeight.w600,
//       color: TextCol.txtbtn,
//     ),
//   ),

//   // Bottom Navigation Bar (exactly like your design)
//   bottomNavigationBarTheme: BottomNavigationBarThemeData(
//     backgroundColor: Background.containbg,
//     selectedItemColor: ButtonCol.mybtn,
//     unselectedItemColor: TextCol.gentext.withOpacity(0.6),
//     type: BottomNavigationBarType.fixed,
//     elevation: 8,
//     selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
//   ),

//   // Buttons
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: ButtonCol.mybtn,
//       foregroundColor: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
//     ),
//   ),

//   // TextField / Input (for future pickup form, address, etc.)
//   inputDecorationTheme: InputDecorationTheme(
//     filled: true,
//     fillColor: TextCol.txtfield,
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: const BorderSide(color: Background.gridbg),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: BorderSide(color: ButtonCol.mybtn, width: 2),
//     ),
//   ),

//   // Floating Action Button (if needed later)
//   floatingActionButtonTheme: FloatingActionButtonThemeData(
//     backgroundColor: ButtonCol.mybtn,
//     foregroundColor: Colors.white,
//   ),
// );