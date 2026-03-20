import 'package:flutter/material.dart';
import '../account and profile/Widgets/primarybtn.dart';
import '../A_Core/Constants/Colors/color.dart';
import 'onbd_two.dart';
class OnbdOne extends StatelessWidget {
  const OnbdOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F2EC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),

              // Progress indicator dots
              const _ProgressDots(total: 3, current: 2),

              const SizedBox(height: 32),

              // Illustration card
              const Expanded(
                child: _IllustrationCard(),
              ),

              const SizedBox(height: 36),

              // Headline text
              const Text(
                'Simple. Convenient. Efficient.',
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
                'Streamlined inventory, pickup, and rewards\nthat work for you.',
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
              PrimaryButton(text: "Log In", colors: ButtonCol.mybtn,
                 onPressed: () {
                   Navigator.push(context,
                   MaterialPageRoute(builder: (_)=> OnbdTwo()));
                 },
                 txtcolors: TextCol.gentext,),
            
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
          width: isActive ? 28 : 8,
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

/// Illustration container with soft green background
class _IllustrationCard extends StatelessWidget {
  const _IllustrationCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFB5CC96).withOpacity(0.45),
        borderRadius: BorderRadius.circular(32),
      ),
      child: const Center(
        child: _DeliveryManIllustration(),
      ),
    );
  }
}

/// Custom-painted delivery man illustration (matching the sketch style)
class _DeliveryManIllustration extends StatelessWidget {
  const _DeliveryManIllustration();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 280,
      child: CustomPaint(
        painter: _DeliveryManPainter(),
      ),
    );
  }
}

class _DeliveryManPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final strokePaint = Paint()
      ..color = const Color(0xFF3C3C3C)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final fillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final greenFill = Paint()
      ..color = const Color(0xFF8FB870)
      ..style = PaintingStyle.fill;

    final skinFill = Paint()
      ..color = const Color(0xFFF5DEB3)
      ..style = PaintingStyle.fill;

    final cx = size.width / 2;

    // --- HEAD ---
    final headCenter = Offset(cx, 78);
    canvas.drawCircle(headCenter, 38, fillPaint);
    canvas.drawCircle(headCenter, 38, strokePaint);

    // Face details - eyes
    canvas.drawCircle(Offset(cx - 12, 72), 3.5, strokePaint..style = PaintingStyle.fill);
    canvas.drawCircle(Offset(cx + 12, 72), 3.5, strokePaint);
    strokePaint.style = PaintingStyle.stroke;

    // Smile
    final smilePath = Path()
      ..moveTo(cx - 10, 90)
      ..quadraticBezierTo(cx, 100, cx + 10, 90);
    canvas.drawPath(smilePath, strokePaint);

    // Nose (small bump)
    final nosePath = Path()
      ..moveTo(cx - 3, 81)
      ..quadraticBezierTo(cx - 6, 87, cx, 88);
    canvas.drawPath(nosePath, strokePaint);

    // --- HAT (polka dot cap) ---
    final hatPath = Path()
      ..moveTo(cx - 40, 58)
      ..quadraticBezierTo(cx - 38, 22, cx, 20)
      ..quadraticBezierTo(cx + 38, 22, cx + 40, 58)
      ..close();
    canvas.drawPath(hatPath, greenFill);
    canvas.drawPath(hatPath, strokePaint);

    // Hat brim
    final brimPath = Path()
      ..moveTo(cx - 44, 58)
      ..quadraticBezierTo(cx, 68, cx + 44, 58);
    canvas.drawPath(brimPath, strokePaint);

    // Polka dots on hat
    final dotPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    for (final dot in [
      Offset(cx - 18, 40),
      Offset(cx, 32),
      Offset(cx + 18, 40),
      Offset(cx - 8, 52),
      Offset(cx + 8, 52),
    ]) {
      canvas.drawCircle(dot, 4, dotPaint);
      canvas.drawCircle(dot, 4, strokePaint..strokeWidth = 1);
    }
    strokePaint.strokeWidth = 2.2;

    // --- BOW TIE ---
    final bowTiePaint = Paint()
      ..color = const Color(0xFF5A8A3C)
      ..style = PaintingStyle.fill;
    // Left wing
    final leftBow = Path()
      ..moveTo(cx - 5, 120)
      ..quadraticBezierTo(cx - 22, 113, cx - 26, 122)
      ..quadraticBezierTo(cx - 22, 131, cx - 5, 124)
      ..close();
    canvas.drawPath(leftBow, bowTiePaint);
    canvas.drawPath(leftBow, strokePaint);
    // Right wing
    final rightBow = Path()
      ..moveTo(cx + 5, 120)
      ..quadraticBezierTo(cx + 22, 113, cx + 26, 122)
      ..quadraticBezierTo(cx + 22, 131, cx + 5, 124)
      ..close();
    canvas.drawPath(rightBow, bowTiePaint);
    canvas.drawPath(rightBow, strokePaint);
    // Knot
    canvas.drawCircle(Offset(cx, 122), 5, bowTiePaint);
    canvas.drawCircle(Offset(cx, 122), 5, strokePaint);

    // --- BODY / APRON ---
    final bodyPath = Path()
      ..moveTo(cx - 52, 130)
      ..quadraticBezierTo(cx - 60, 145, cx - 55, 220)
      ..lineTo(cx + 55, 220)
      ..quadraticBezierTo(cx + 60, 145, cx + 52, 130)
      ..close();
    canvas.drawPath(bodyPath, fillPaint);
    canvas.drawPath(bodyPath, strokePaint);

    // Apron front panel
    final apronPath = Path()
      ..moveTo(cx - 30, 135)
      ..lineTo(cx - 36, 220)
      ..lineTo(cx + 36, 220)
      ..lineTo(cx + 30, 135)
      ..close();
    canvas.drawPath(apronPath, greenFill..color = const Color(0xFFB5CC96));
    canvas.drawPath(apronPath, strokePaint);

    // Apron pocket
    final pocketPath = Path()
      ..moveTo(cx - 18, 180)
      ..lineTo(cx - 18, 210)
      ..lineTo(cx + 18, 210)
      ..lineTo(cx + 18, 180)
      ..quadraticBezierTo(cx, 172, cx - 18, 180);
    canvas.drawPath(pocketPath, fillPaint);
    canvas.drawPath(pocketPath, strokePaint);

    // --- LEFT ARM (holding clipboard) ---
    final leftArmPath = Path()
      ..moveTo(cx - 52, 145)
      ..quadraticBezierTo(cx - 80, 155, cx - 85, 185)
      ..quadraticBezierTo(cx - 82, 200, cx - 68, 198)
      ..quadraticBezierTo(cx - 60, 196, cx - 58, 185)
      ..quadraticBezierTo(cx - 55, 170, cx - 52, 165);
    canvas.drawPath(leftArmPath, fillPaint);
    canvas.drawPath(leftArmPath, strokePaint);

    // --- RIGHT ARM (raised, holding phone/device) ---
    final rightArmPath = Path()
      ..moveTo(cx + 52, 145)
      ..quadraticBezierTo(cx + 75, 140, cx + 82, 120)
      ..quadraticBezierTo(cx + 88, 105, cx + 78, 100)
      ..quadraticBezierTo(cx + 68, 96, cx + 62, 112)
      ..quadraticBezierTo(cx + 58, 128, cx + 52, 145);
    canvas.drawPath(rightArmPath, fillPaint);
    canvas.drawPath(rightArmPath, strokePaint);

    // Device/phone in right hand
    final deviceRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
          center: Offset(cx + 72, 108), width: 22, height: 30),
      const Radius.circular(4),
    );
    canvas.drawRRect(deviceRect, greenFill..color = const Color(0xFF7A9E5F));
    canvas.drawRRect(deviceRect, strokePaint);

    // Screen on device
    canvas.drawRect(
      Rect.fromCenter(center: Offset(cx + 72, 107), width: 14, height: 20),
      fillPaint,
    );
    canvas.drawRect(
      Rect.fromCenter(center: Offset(cx + 72, 107), width: 14, height: 20),
      strokePaint..strokeWidth = 1.2,
    );
    strokePaint.strokeWidth = 2.2;

    // Screen lines
    for (int i = 0; i < 3; i++) {
      canvas.drawLine(
        Offset(cx + 64, 100 + i * 6.0),
        Offset(cx + 80, 100 + i * 6.0),
        strokePaint..strokeWidth = 1..color = const Color(0xFF7A9E5F),
      );
    }
    strokePaint
      ..strokeWidth = 2.2
      ..color = const Color(0xFF3C3C3C);

    // --- LEGS ---
    // Left leg
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(cx - 46, 218, 32, 50),
        const Radius.circular(8),
      ),
      fillPaint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(cx - 46, 218, 32, 50),
        const Radius.circular(8),
      ),
      strokePaint,
    );
    // Right leg
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(cx + 14, 218, 32, 50),
        const Radius.circular(8),
      ),
      fillPaint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(cx + 14, 218, 32, 50),
        const Radius.circular(8),
      ),
      strokePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Outlined continue button
class _ContinueButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _ContinueButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: Color(0xFF7A9E5F),
            width: 1.8,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.transparent,
          foregroundColor: const Color(0xFF4A7A30),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Continue',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward, size: 18),
          ],
        ),
      ),
    );
  }
}