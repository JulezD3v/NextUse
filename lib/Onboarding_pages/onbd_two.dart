import 'package:flutter/material.dart';
import 'package:nextuse/Onboarding_pages/onbd_one.dart';
import '../A_Core/widgets/primarybtn.dart';
import '../A_Core/Constants/Colors/palette.dart';
import '../A_Core/Constants/Colors/color.dart';
import 'onbd_three.dart';
class OnbdTwo extends StatefulWidget {
  const OnbdTwo({super.key});

  @override
  State <OnbdTwo> createState() => OnbdTwoState();
}

class OnbdTwoState extends State<OnbdTwo> {
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
              const _ProgressDots(total: 3, current: 2),

              const SizedBox(height: 32),

          
               Expanded(

                child:ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Image.asset(
          'assets/Images/Onboarding/Onboarding 2.png', // ← change to your chosen file name
          fit: BoxFit.cover, 
          width: double.infinity,
          //height: double.infinity,
          alignment: Alignment.center,

          // Accessibility
          semanticLabel: 'Person happily sorting recyclable waste at home',
        ),
      ),
    
              ),

              const SizedBox(height: 36),

              // Headline text
              const Text(
                'Cleaner. Healthier. Happier.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2C2C2C),
                  height: 1.3,
                ),
              ),

              const SizedBox(height: 10),

              // Subtitle
              const Text(
                'People, communities and planet\n whaen we all do our part.',
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
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(text: "Back", colors: GreenColors.c200,
                       onPressed: () {
                         Navigator.push(context,
                         MaterialPageRoute(builder: (_)=> OnbdOne()));
                       },
                       txtcolors: TextCol.gentext,),
                  ),

                     const SizedBox(width: 8,),

                  Expanded(
                    child: PrimaryButton(text: "Continue ", colors: YellowColors.c200,
                       onPressed: () {
                         Navigator.push(context,
                         MaterialPageRoute(builder: (_)=> OnbdThree()));
                       },
                       txtcolors: TextCol.gentext,),
                  ),

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


 