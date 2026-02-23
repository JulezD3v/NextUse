import 'package:flutter/material.dart';
import 'package:nextuse/HomePage/home_content.dart';
import 'Card/rem_widget.dart';
import '../Colors/color.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Background().mainbg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
            
              Container(
                height: 150, // Add a non-zero height
                child: ReminderCard(
                  title: "Reminder",
                  message: "Your next pickup is scheduled for Saturday 14 March",
                ),
              ),
              SizedBox(height: 20,),
              HomeContent(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Hole extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: Background().mainbg, // must match screen background
        shape: BoxShape.circle,
      ),
    );
  }
}