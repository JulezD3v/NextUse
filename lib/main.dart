import 'package:flutter/material.dart';
import 'package:nextuse/MainScreens/homepage.dart';

// Fix 1: Use correct import paths — adjust based on where the files really are
// Most likely one of these will work — test one at a time
import 'package:nextuse/account_profile/splashScreen.dart';           // ← try this first
// import 'package:nextuse/Account%20and%20Profile/splashScreen.dart';
// import 'package:nextuse/account_profile/splash_screen.dart';   // after rename

import 'package:nextuse/Onboarding_pages/onbd_one.dart';
// import 'package:nextuse/onboarding_pages/onbd_one.dart';      // after rename

void main() {
  runApp(const NextUseApp());
}

class NextUseApp extends StatelessWidget {
  const NextUseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NextUse',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),   // ← must match the class name exactly!
        '/onbd_one': (context) => const OnbdOne(),
        '/home':(context) => const HomePage(),
        // Add more later...
      },
    );
  }
}