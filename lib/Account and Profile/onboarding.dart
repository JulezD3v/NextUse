import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:nextuse/Account%20and%20Profile/signup.dart';
import 'package:nextuse/Core/Constants/Colors/color.dart';
import 'Widgets/button_widget.dart';
import './login.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Background.mainbg, // beige background
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
            
                 Image.asset(
                'assets/Images/NextUse Logo/Large Logo.png',
                height: 300,),
            
                PrimaryButton(text: "Log In", colors: ButtonCol.mybtn,
                 onPressed: () {
                   Navigator.push(context,
                   MaterialPageRoute(builder: (_)=> Login()));
                 },
                 txtcolors: TextCol.gentext,),
            
                const SizedBox(height: 20,),
            
                PrimaryButton(text: "Sign Up", colors: ButtonCol.mybtn,
                 onPressed: () {
                   Navigator.push(context,
                   MaterialPageRoute(builder: (_)=> Signup()));
                 },
                 txtcolors: TextCol.gentext,),
            
                const SizedBox(height: 30,),
            
               GestureDetector(
                onTap: (){},
                 child: Text("PickUp Agent? SignUp/Login here",
                 style: TextStyle(color: TextCol.txtcol,fontSize: 10),
                 ),
               ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
