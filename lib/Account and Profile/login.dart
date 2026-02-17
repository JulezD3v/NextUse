import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:nextuse/Account and Profile/Widgets/container_widget.dart';
import 'package:nextuse/Account and Profile/Widgets/textfield_widget.dart';
import 'package:nextuse/Account and Profile/Widgets/button_widget.dart';
import 'package:nextuse/Account%20and%20Profile/signup.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E4D8), // beige background
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              const SizedBox(height: 40),

              // 🔹 Logo Circle
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    )
                  ],
                ),
                child: const Icon(
                  Icons.recycling,
                  size: 60,
                  color: Color(0xFF8AAE3F),
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 App Name
              const Text(
                "NextUse",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5A5546),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Turning waste into worth",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF7A7464),
                ),
              ),

              const SizedBox(height: 40),

              // Main Container
              AuthContainer(
                title: "Welcome Back",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AuthTextField(
                      label: "Email",
                      hint: "hello@nextuse.com",
                      icon: Icons.email,
                    ),

                    const AuthTextField(
                      label: "Password",
                      hint: "••••••••",
                      icon: Icons.lock,
                      obscure: true,
                    ),

                    const SizedBox(height: 10),

                    PrimaryButton(text: "Login", onPressed: () {}, colors: Colors.green,),

                    const SizedBox(height: 10),
                    
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: const Color(0xFF8AAE3F),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    Row(
                      children: [
                        const Expanded(child: Divider()),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text("OR"),
                        ),
                        const Expanded(child: Divider()),
                      ],
                    ),
                    
                    const SizedBox(height: 30),
                    PrimaryButton(text: "Login with Google →", onPressed: () {}, colors: const Color.fromARGB(255, 214, 234, 248),),
                    const SizedBox(height: 10),

                   Center(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Color(0xFF5A5546),
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(text: "New here? "),
                            TextSpan(
                              text: "Create an account",
                              style: TextStyle(
                                color: Color(0xFF8AAE3F),
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {
                             Navigator.push(context,
                             MaterialPageRoute(builder: (_) => Signup()));
                              },// SignUp Page
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                
              ),

              const SizedBox(height: 30),

              const Text(
                "© 2024 NextUse. All rights reserved.",
                style: TextStyle(fontSize: 12, color: Color(0xFF9A958B)),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Custom TextField
  // static Widget _buildTextField({
  //   required IconData icon,
  //   required String hint,
  //   required bool obscure,
  // }) {
  //   return TextField(
  //     obscureText: obscure,
  //     decoration: InputDecoration(
  //       prefixIcon: Icon(icon, color: Color(0xFF8AAE3F)),
  //       hintText: hint,
  //       filled: true,
  //       fillColor: Colors.white,
  //       contentPadding: const EdgeInsets.symmetric(vertical: 18),
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(40),
  //         borderSide: BorderSide.none,
  //       ),
  //     ),
   //  );
 // }
}

  // Row(
  //                     children: [
  //                       const Expanded(child: Divider()),
  //                       const Padding(
  //                         padding: EdgeInsets.symmetric(horizontal: 10),
  //                         child: Text("OR"),
  //                       ),
  //                       const Expanded(child: Divider()),
  //                     ],
  //                   ),