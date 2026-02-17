import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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

              const Text(
                "NextUse",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5A5546),
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
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F1E9),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Center(
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF5A5546),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    _buildField("Full Name", "Jane Doe", Icons.person),
                    _buildField("Email Address", "jane@example.com", Icons.email),
                    _buildField("Phone Number", "+1 (555) 000-0000", Icons.phone),
                    _buildField("Password", "••••••••", Icons.lock, obscure: true),

                    const SizedBox(height: 10),

                    // 🔹 Terms Row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.circle_outlined,
                          size: 20,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                color: Color(0xFF5A5546),
                                fontSize: 14,
                              ),
                              children: [
                                TextSpan(text: "I agree to the "),
                                TextSpan(
                                  text: "Terms",
                                  style: TextStyle(
                                    color: Color(0xFF8AAE3F),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(text: " and "),
                                TextSpan(
                                  text: "Privacy Policy",
                                  style: TextStyle(
                                    color: Color(0xFF8AAE3F),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // 🔹 Create Account Button
                    Container(
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                        color: const Color(0xFFA8C0CF),
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 6),
                          )
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "✔  Create Account",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF5A5546),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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

  // 🔹 Reusable Field Builder
  static Widget _buildField(
    String label,
    String hint,
    IconData icon, {
    bool obscure = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF5A5546),
          ),
        ),

        const SizedBox(height: 8),

        TextField(
          obscureText: obscure,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.grey),
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide.none,
            ),
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
