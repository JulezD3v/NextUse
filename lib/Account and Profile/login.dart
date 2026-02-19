import 'package:flutter/material.dart';
import 'package:nextuse/Account%20and%20Profile/signup.dart';
import 'package:nextuse/Account%20and%20Profile/user_homepage.dart';
import 'Widgets/button_widget.dart';
import 'Widgets/textfield_widget.dart';
import 'package:nextuse/Colors/color.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Background().mainbg, // light beige background
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                
                mainAxisSize: MainAxisSize.min,
                children: [
              
                  // =========================
                  // Logo Icon
                  // =========================
                   Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Background().containbg,
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.1),
                      blurRadius: 15,offset: const Offset(0, 8),
                    )
                  ],
                ),
                child: Icon(Icons.recycling, size: 40, color: ButtonCol().btnIcon,
                ),
              ),
              
                  const SizedBox(height: 10),
              
                  // App Name
                  
                  RichText(
                    text: TextSpan(
                      text: "Next",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold, color: Color(0xFF6E7F3F),),

                      children:[
                        TextSpan(
                          text:"Use", style: TextStyle(color:TextCol().gentext,fontSize: 32,fontWeight: FontWeight.bold,),
                        )
                      ]),
                      
                        ),
                               
              const SizedBox(height: 15),
                  // Welcome Text

                   Text(
                    "Welcome back!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF8B7E54),
                    ),
                  ),
            
          
                  const SizedBox(height: 30),

                  AuthTextField(label: "Email", hint: "name@example.com", icon: Icons.email),
                  const SizedBox(height: 20),

                  AuthTextField(label: "Password", hint: "*****", icon:Icons.fullscreen ),
     
              
                  const SizedBox(height:5),
              
                  // Forgot password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot password?",
                        style: TextStyle(
                          color: Color(0xFF6E7F3F),
                        ),
                      ),
                    ),
                  ),
              
                  const SizedBox(height: 10),
              
                  // Login Button
                 PrimaryButton(text: "Log In", colors: ButtonCol().mybtn,
                 onPressed: () {
                   Navigator.push(context,
                   MaterialPageRoute(builder: (_)=> UserHomepage()));
                 },),
            
                  const SizedBox(height:20),
              
                  // Sign up text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Color(0xFF8B7E54)),
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => Signup()));
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            color: Color(0xFF6E7F3F),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                
              ]),
            ),
          ),
        ),
      ),
    );     
  }
}