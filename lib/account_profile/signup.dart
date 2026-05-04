import 'package:flutter/material.dart';
import 'package:nextuse/account_profile/login.dart';
//import 'Widgets/container_widget.dart';
import 'Widgets/textfield_widget.dart';
import '../A_Core/widgets/primarybtn.dart';
import 'Widgets/accountop.dart';
import '../MainScreens/homepage.dart';
import '../HomePage/home_content.dart';
import 'package:nextuse/A_Core/Constants/Colors/color.dart';
import 'Widgets/role_widget.dart';

class Signup extends StatefulWidget {
   const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
   

}

class _SignupState extends State<Signup> {
  bool isChecked = false;
  UserRole? selectedRole;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Background.mainbg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              const SizedBox(height: 40),

              // 🔹 Logo Circle
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ButtonCol.btnIcon,
                ),
                child:Icon(
                  Icons.recycling,
                  size: 40,
                  color: Background.containbg,
                ),
              ),

              const SizedBox(height: 10),

               RichText(
                        text: TextSpan(style: TextStyle(color: Color(0xFF8AAE3F)),
                          children: [
                            TextSpan(text: "Next", style:TextStyle(color:Color(0xFF6E7F3F),fontSize: 32,fontWeight: FontWeight.bold,)),
                            TextSpan(text: "Use",style: TextStyle(color:TextCol.gentext,fontSize: 32,fontWeight: FontWeight.bold,)),
                          ],
                        ),
                      ),

              const SizedBox(height: 10),

              Text(
                "Create an Account",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color:Color(0xFF8B7E54),
                ),
              ),

              const SizedBox(height: 30),

          Padding(
            
            padding: const EdgeInsets.all(20.0),
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                    const AuthTextField(label: "Full Name", hint: "Jane Doe", icon: Icons.person), 
                    const SizedBox(height: 10), 
                    const AuthTextField(label: "Email Address", hint: "name@example.com", icon: Icons.email),
                    const SizedBox(height: 10),                    

                    const AuthTextField(label: "Password", hint: "*****", icon: Icons.fullscreen),
                    const SizedBox(height: 10),
                    const AuthTextField(label: "Confirm Password", hint: "*****", icon: Icons.fullscreen),
                    const SizedBox(height: 8),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Select Account Type",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: TextCol.gentext,
                          ),
                        ),
                        const SizedBox(height: 12),

                        RoleSelector(
                          selectedRole: selectedRole,
                          onChanged: (role) {
                            setState(() {
                              selectedRole = role;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),

                    PrimaryButton(
                      text: "Create Account",
                      colors: ButtonCol.mybtn,
                      onPressed: () {
                        // to be changed
                        if (selectedRole == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please select account type"),
                            ),
                          );
                          return;
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => HomePage()),
                        );
                      },
                      txtcolors: TextCol.gentext,
                    ), //<= To Homepage
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.brown.shade200,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'or continue with',
                            style: TextStyle(
                              color: Colors.brown.shade300,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.brown.shade200,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                  

                 const SizedBox(height: 20),

                    // Social icons row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialButton(
                          onTap: () {
                            // Handle Google sign-in
                          },
                          child: Image.asset(
                            'assets/Images/Signin alternatives logos/Google.png',
                            width: 24,
                            height: 24,
                          ),
                        ),

                        const SizedBox(width: 20),

                        SocialButton(
                          onTap: () {
                            //Facebook sign-in
                          },
                          child: Image.asset(
                            'assets/Images/Signin alternatives logos/FB.png', 
                            width: 24,
                            height: 24,
                          ),
                        ),

                        const SizedBox(width: 20),

                        SocialButton(
                          onTap: () {
                            //Apple sign-in
                          },
                          child: Image.asset(
                            'assets/Images/Signin alternatives logos/Apple.png', 
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                ),
              
               

        const SizedBox(height: 20),

               GestureDetector(
                      onTap: () {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              isChecked
                                  ? Icons.check_circle_rounded
                                  : Icons.circle_outlined,
                              size: 20,
                              color: Colors.white,
                            ),
                        
                            const SizedBox(width: 5),
                        
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  text: "I agree to the ",
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 13,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Terms",
                                      style: TextStyle(
                                        color: const Color(0xFF8AAE3F),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: " and ",
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                    TextSpan(
                                      text: "Privacy Policy",
                                      style: TextStyle(
                                        color: const Color(0xFF8AAE3F),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
              const SizedBox(height: 10),
              // 🔹 Bottom Sign In
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(color: Color(0xFF8B7E54)),
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            color: Color(0xFF6E7F3F),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
            ],
          ),
        ),
      ),
    );
  }
}