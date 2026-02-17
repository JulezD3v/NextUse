import 'package:flutter/material.dart';
import 'package:nextuse/Account and Profile/Widgets/container_widget.dart';
import 'package:nextuse/Account and Profile/Widgets/textfield_widget.dart';
import 'package:nextuse/Account and Profile/Widgets/button_widget.dart';
import 'package:nextuse/Account%20and%20Profile/user_homepage.dart';
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E4D8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              const SizedBox(height: 40),

              // 🔹 Logo Circle
              Container(
                height: 110,
                width: 110,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF8AAE3F),
                ),
                child: const Icon(
                  Icons.recycling,
                  size: 55,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 20),

               RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Color(0xFF8AAE3F),
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(text: "Next", style:TextStyle(color:Color(0xFF5A5546),fontSize: 32,fontWeight: FontWeight.bold,)),
                            TextSpan(text: "Use",style: TextStyle(color: Color(0xFF8AAE3F),fontSize: 32,fontWeight: FontWeight.bold,)),
                          ],
                        ),
                      ),

              const SizedBox(height: 8),

              const Text(
                "Join the sustainable movement.",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF7A7464),
                ),
              ),

              const SizedBox(height: 30),

              // 🔹 Main Card
              AuthContainer(title: "Create Account", 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                  const AuthTextField(label: "Full Name", hint: "Jane Doe", icon: Icons.person), 
                  const SizedBox(height: 10), 
                  const AuthTextField(label: "Email Address", hint: "name@example.com", icon: Icons.email),
                  const SizedBox(height: 10),
                  const AuthTextField(label: "Password", hint: ".....", icon: Icons.lock),
                  const SizedBox(height: 10),
                  const AuthTextField(label: "Confirm Password", hint: "......", icon: Icons.lock),
                  const SizedBox(height: 10),

                  RichText(text: TextSpan(
                                text: "I agree to the ",
                                children: [TextSpan(text: "Terms", style: TextStyle(color: Color(0xFF8AAE3F),fontWeight: FontWeight.w600,),
                                ),
                                TextSpan(text: " and "),
                                TextSpan(
                                  text: "Privacy Policy",
                                  style: TextStyle(
                                    color: Color(0xFF8AAE3F),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                ]), 
                                ),
                  PrimaryButton(text: "Create Account",colors:Color(0xFF8AAE3F), 
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_) => UserHomepage()));},) //<= To Homepage 
                 ],
              )
              ),
              const SizedBox(height: 30),

              // 🔹 Bottom Sign In
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: Color(0xFF5A5546),
                    fontSize: 15,
                  ),
                  children: [
                    TextSpan(text: "Already have an account? "),
                    TextSpan(
                      text: "Sign in",
                      style: TextStyle(
                        color: Color(0xFF8AAE3F),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}