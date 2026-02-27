import 'package:flutter/material.dart';

class TabContainerCard extends StatelessWidget {
  // Only text is adjustable
  final String primaryTabText;
  final String secondaryTabText;
  final Widget? child;

  const TabContainerCard({
    super.key,
    this.primaryTabText = 'Add Items',
    this.secondaryTabText = 'Step 1 of 3',
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
      
          // ── TWO TABS ROW ─────────────────────────────────
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
      
                // Primary tab (larger, tan color)
                Container(
                  width: 129.9,
                  height: 37.77,
                  decoration: BoxDecoration(
                    color: Color(0xFFC9C8B1),
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
                  width: 92.3,
                  height: 25.3,
                  decoration:BoxDecoration(
                    color: Color(0xFF96C8D6),
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
      
          // ── LARGE CONTAINER ──────────────────────────────
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              width: 329.76,
              height: 300.3,
              decoration: BoxDecoration(
                color: Color(0xFFEDE8D4),
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