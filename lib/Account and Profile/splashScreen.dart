import 'package:flutter/material.dart';
import'package:nextuse/Account and Profile/login.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  //late Timer _timer;

  @override
  @override
void initState() {
  super.initState();

  _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..repeat();

  _initializeApp();
}

Future<void> _initializeApp() async {
  await Future.delayed(const Duration(seconds: 10));

  if (!mounted) return;

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (_) => const Login()),
  );
}


  @override
  void dispose() {
    _controller.dispose();
    //_timer.cancel();
    super.dispose();
  }

  Widget _buildDot(int index) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {

        // Creates delay between dots
        double animationValue =
            (_controller.value - (index * 0.2)) % 1.0;

        double opacity = animationValue < 0.5
            ? animationValue * 2
            : (1 - animationValue) * 2;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Opacity(
            opacity: opacity.clamp(0.2, 1.0),
            child: Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                color: Color(0xFF8AAE3F), // Green tone
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E4D8), // Soft beige
      body: SafeArea(
        child: Column(
          children: [

            const Spacer(),

            // Logo
              //  Icon(Icons.recycling_rounded,
              //  size: 150,
              //  color: Colors.green[900],),
            Image.asset(
              'assets/Logo/logo_bg.png',
              height: 300,
            ),


            // Tagline
            const Text(
              "Sustainable Living Made Simple",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF6D675C),
                letterSpacing: 0.5,
              ),
            ),

            const Spacer(),

            // Loading Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDot(0),
                _buildDot(1),
                _buildDot(2),
              ],
            ),

            const SizedBox(height: 20),

            const Text(
              "LOADING YOUR IMPACT...",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF9A958B),
                letterSpacing: 1.2,
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
