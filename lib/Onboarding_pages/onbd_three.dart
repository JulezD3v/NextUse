import 'package:flutter/material.dart';
import 'package:nextuse/account_profile/login.dart';
import 'package:nextuse/account_profile/signup.dart';
import '../account_profile/Widgets/primarybtn.dart';
import '../A_Core/Constants/Colors/palette.dart';
import '../A_Core/Constants/Colors/color.dart';

class OnbdThree extends StatefulWidget {
  const OnbdThree({super.key});

  @override
  State<OnbdThree> createState() => _OnbdThreeState();
}

class _OnbdThreeState extends State<OnbdThree> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xFFF5F2EC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),

              // Progress indicator dots
              const _ProgressDots(total: 3, current: 3),

              const SizedBox(height: 32),

          
               ClipRRect(
                       borderRadius: BorderRadius.circular(32),
                       child: Image.asset(
                         'assets/Images/Onboarding/Onboarding 3.png', // ← change to your chosen file name
                         fit: BoxFit.cover, 
                         width: double.infinity,
                         alignment: Alignment.center,
               
                         // Accessibility
                         semanticLabel: 'Person happily sorting recyclable waste at home',
                       ),
                     ),

              const SizedBox(height: 15),

              // Headline text
              RichText(
                        text: TextSpan(style: TextStyle(color: Color(0xFF8AAE3F)),
                          children: [
                            TextSpan(text: "Next", style:TextStyle(color:Color(0xFF6E7F3F),fontSize: 32,fontWeight: FontWeight.bold,)),
                            TextSpan(text: "Use",style: TextStyle(color:TextCol.gentext,fontSize: 32,fontWeight: FontWeight.bold,)),
                          ],
                        ),
                      ),

              const SizedBox(height: 10),

              // Subtitle
              const Text(
                'Good for Mother Earth\n Good for you.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF7A7A7A),
                  height: 1.6,
                ),
              ),

              const SizedBox(height: 36),

              // Continue button
              Column(
                children: [
                
                     PrimaryButton(text: "SignUp", colors: GreenColors.c200,
                       onPressed: () {
                         Navigator.push(context,
                         MaterialPageRoute(builder: (_)=> Signup()));
                       },
                       txtcolors: TextCol.gentext,),
                  

                     const SizedBox(height:10,),

                  
                    PrimaryButton(text: "Login ", colors: YellowColors.c200,
                       onPressed: () {
                         Navigator.push(context,
                         MaterialPageRoute(builder: (_)=> Login()));
                       },
                       txtcolors: TextCol.gentext,),
                

                ],
              ),
            
                const SizedBox(height: 20,),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

/// Three-dot progress indicator
class _ProgressDots extends StatelessWidget {
  final int total;
  final int current;

  const _ProgressDots({required this.total, required this.current});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(total, (index) {
        final isActive = index == current - 1;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 45 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive
                ? const Color(0xFF7A9E5F)
                : const Color(0xFFCECECE),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
