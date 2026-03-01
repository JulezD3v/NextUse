import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nextuse/Account%20and%20Profile/signup.dart';
import 'package:nextuse/MainScreens/homepage.dart';
import 'package:nextuse/HomePage/home_content.dart';

import 'Widgets/button_widget.dart';
import 'Widgets/textfield_widget.dart';

import 'package:nextuse/Features/auth/bloc/auth_bloc.dart';
import 'package:nextuse/Features/auth/bloc/auth_event.dart';
import 'package:nextuse/Features/auth/bloc/auth_state.dart';

import 'package:nextuse/Core/Constants/Colors/color.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Background.mainbg, // light beige background
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            Navigator.pushReplacementNamed(context, '/home');
            // or: Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Logo
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Background.containbg,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 15,
                                offset: const Offset(0, 8),
                              )
                            ],
                          ),
                          child: Icon(
                            Icons.recycling,
                            size: 40,
                            color: ButtonCol.btnIcon,
                          ),
                        ),

                        const SizedBox(height: 10),

                        // App Name
                        RichText(
                          text: TextSpan(
                            text: "Next",
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF6E7F3F),
                            ),
                            children: [
                              TextSpan(
                                text: "Use",
                                style: TextStyle(
                                  color: TextCol.gentext,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),

                        const SizedBox(height: 15),

                        // Welcome Text
                        const Text(
                          "Welcome back!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF8B7E54),
                          ),
                        ),

                        const SizedBox(height: 30),

                        AuthTextField(
                          label: "Email",
                          hint: "name@example.com",
                          icon: Icons.email,
                          controller: _emailController,          // ← added
                        ),

                        const SizedBox(height: 10),

                        AuthTextField(
                          label: "Password",
                          hint: "*****",
                          icon: Icons.lock,                       // changed icon to more appropriate one
                          
                          controller: _passwordController,        // ← added
                        ),

                        const SizedBox(height: 5),

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

                        // Login Button – only this onPressed changed
                        PrimaryButton(
                          text: "Log In",
                          colors: ButtonCol.mybtn,
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? true) {
                              context.read<AuthBloc>().add(
                                    LoginSubmitted(
                                      _emailController.text.trim(),
                                      _passwordController.text.trim(),
                                    ),
                                  );
                            }
                          },
                          txtcolors: TextCol.gentext,
                        ),

                        const SizedBox(height: 20),

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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => const Signup()),
                                );
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}