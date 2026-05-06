import 'package:flutter/material.dart';
import 'package:nextuse/A_Core/Constants/Colors/palette.dart';
import '../Constants/Colors/color.dart';

class TabContainerCard extends StatelessWidget {

  final double? containerWidth;
  final double? containerHeight;
  // Only text is adjustable
  final String primaryTabText;
  final String secondaryTabText;
  final Widget? child;

  const TabContainerCard({
    super.key,
    this.primaryTabText = ' Add Items ',
    this.secondaryTabText = ' Step 1 of 3 ',
    this.child,
    this.containerWidth,
    this.containerHeight

  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
      
          // ── TWO TABS ROW ─────────────────────────────────
          Center(
            child: SizedBox(
              width: containerWidth ?? MediaQuery.of(context).size.width * 0.9,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    //width: containerWidth ?? 329.76,
                    //width: 129.9,
                    height: 37.77,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: GreenColors.c200,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      border: Border.all(width: 1),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      primaryTabText,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3D3820),
                      ),
                    ),
                  ),
                    
                  // Secondary tab (smaller, blue color)
                  Container(
                   // width: 92.3,
                    height: 25.3,
                    decoration:BoxDecoration(
                      color:BlueColors.c200,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      border: Border.all(width: 1),
                    ),
                    
                    alignment: Alignment.center,
                    child: Text(
                      secondaryTabText,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                    
                ],
              ),
            ),
          ),
      
          // ── LARGE CONTAINER ──────────────────────────────
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              //width: containerWidth ?? 329.76,
              height: containerHeight ?? 300.3,
              decoration: BoxDecoration(
                color: Background.containbg,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                  // topLeft stays 0 — sits flush under primary tab
                ),
                border: Border.all(width: 1),
              ),
              child: child,
            ),
          ),
      
        ],
      ),
    );
  }
}