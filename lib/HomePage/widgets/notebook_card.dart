import 'package:flutter/material.dart';

// ─────────────────────────────────────────────
// 1. REUSABLE NOTEBOOK SHELL
//    Reuse this for ANY notebook-style card.
//    Just pass a different child each time.
// ─────────────────────────────────────────────
class NotebookCard extends StatelessWidget {
  final String title;
  final String? actionLabel;
  final VoidCallback? onActionTap;
  final Widget child;
  final Color? backgroundColor;
  final double? height;
  final int holeCount; // 0 = auto

  const NotebookCard({
    super.key,
    this.title = '',
    this.actionLabel,
    this.onActionTap,
    required this.child,
    this.backgroundColor,
    this.height,
    this.holeCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? const Color(0xFFF0ECD8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── HOLES COLUMN (reused from ReminderCard) ──
          _NotebookHoles(
            height: height ?? 500,
            holeCount: holeCount,
          ),

          // ── CONTENT ──
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 14, 14, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title row
                  if (title.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3D3820),
                            ),
                          ),
                          if (actionLabel != null)
                            GestureDetector(
                              onTap: onActionTap,
                              child: Text(actionLabel!,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF5A7A3A),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),

                  // Whatever you pass in
                  child,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// 2. HOLES — same pattern as ReminderCard
// ─────────────────────────────────────────────
class _NotebookHoles extends StatelessWidget {
  final double height;
  final int holeCount;

  const _NotebookHoles({required this.height, required this.holeCount});

  @override
  Widget build(BuildContext context) {
    final int count = holeCount > 0 ? holeCount : (height / 55).floor().clamp(2, 20);
    return Container(
      width: 32,
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(color: Color(0xFFD6CFA8), width: 1),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(count, (_) => _Hole()),
      ),
    );
  }
}

class _Hole extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFE0D8C0),
        border: Border.all(color: const Color(0xFFC4BB98), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 3,
            offset: const Offset(1, 1),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// 3. MY HIGHLIGHTS CONTENT
//    This is the child you pass into NotebookCard
//    for this specific screen. Swap it out for
//    anything else when reusing NotebookCard.
// ─────────────────────────────────────────────
class MyHighlightsContent extends StatelessWidget {
  final String highlightMessage;
  final String highlightBoldPart; // the green bold part
  final String earningsPeriod;
  final String earningsAmount;
  final String earningsCurrency;
  final VoidCallback? onViewWallet;
  final String plasticKg;
  final String plasticLabel;
  final int binCount; // ← drives how many bin icons render
  final String binLabel;
  final Color? highlightCardColor;
  final Color? earningsCardColor;
  final Color? statCardColor;
  final Color? accentColor;

  const MyHighlightsContent({
    super.key,
    this.highlightMessage = 'You are the ',
    this.highlightBoldPart = 'highest resident earner',
    this.earningsPeriod = "February's Earnings",
    this.earningsAmount = '31,680',
    this.earningsCurrency = '₦',
    this.onViewWallet,
    this.plasticKg = '50 kg',
    this.plasticLabel = 'All the plastic you saved from landfill this year',
    this.binCount = 4,
    this.binLabel = 'Wheelie bins filled with cans you\'ve recycled',
    this.highlightCardColor,
    this.earningsCardColor,
    this.statCardColor,
    this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color green = accentColor ?? const Color(0xFF5A7A3A);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [

        // ── TOP: ECO HIGHLIGHT CARD ──────────────────────
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: highlightCardColor ?? const Color(0xFFDCE8CF),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Message with bold green segment
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFF3D3820),
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                  ),
                  children: [
                    TextSpan(text: highlightMessage),
                    TextSpan(
                      text: highlightBoldPart,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: green,
                      ),
                    ),
                    const TextSpan(
                      text: ' in your neighbourhood this month!',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // ── EARNINGS SUB-CARD ──
              Container(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                decoration: BoxDecoration(
                  color: earningsCardColor ?? const Color(0xFFEEF4E4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(earningsPeriod,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: green,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text('$earningsCurrency $earningsAmount',
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3D3820),
                      ),
                    ),
                    const SizedBox(height: 4),
                    GestureDetector(
                      onTap: onViewWallet,
                      child: Text('View wallet',
                        style: TextStyle(
                          fontSize: 13,
                          color: green,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // ── BOTTOM: STAT CARDS ROW ───────────────────────
        Row(
          children: [

            // Plastic saved card
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: statCardColor ?? const Color(0xFFE8E3CF),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.scale_outlined, color: green, size: 22),
                        const SizedBox(width: 6),
                        Text(plasticKg,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: green,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(plasticLabel,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3D3820),
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 10),

            // Bins card — icons scale with binCount
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: statCardColor ?? const Color(0xFFE8E3CF),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Bin icons — one per binCount
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: List.generate(
                        binCount,
                        (_) => Icon(
                          Icons.delete_outline,
                          color: green,
                          size: 22,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(binLabel,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3D3820),
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ],
    );
  }
}