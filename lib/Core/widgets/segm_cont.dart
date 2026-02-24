import 'package:flutter/material.dart';
import '../Constants/Colors/color.dart';

class TopSegmentContainer extends StatefulWidget {
  final List<String> tabs;

  const TopSegmentContainer({
    super.key,
    required this.tabs,
  });

  @override
  State<TopSegmentContainer> createState() =>
      _TopSegmentContainerState();
}

class _TopSegmentContainerState
    extends State<TopSegmentContainer> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Background.containbg,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: ButtonCol.btnbound,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          /// 🔹 TOP NAVIGATOR
          Container(
            decoration: BoxDecoration(
              color: Background.gridbg,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(23),
              ),
            ),
            child: Row(
              children: List.generate(
                widget.tabs.length,
                (index) => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12),
                      decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? Background.containbg
                            : Colors.transparent,
                        borderRadius: BorderRadius.only(
                          topLeft: index == 0
                              ? const Radius.circular(23)
                              : Radius.zero,
                          topRight: index ==
                                  widget.tabs.length - 1
                              ? const Radius.circular(23)
                              : Radius.zero,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          widget.tabs[index],
                          style: TextStyle(
                            color: selectedIndex == index
                                ? TextCol.gentext
                                : TextCol.gentext
                                    .withOpacity(0.6),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          /// 🔹 EMPTY LARGE CONTENT AREA
          Container(
            height: 250, // You can change this
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Background.containbg,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(23),
              ),
            ),
          ),
        ],
      ),
    );
  }
}