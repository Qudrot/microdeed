import 'package:flutter/material.dart';
import 'package:microdeed/design_system/colors.dart';
import 'package:microdeed/design_system/spacers.dart';
import 'package:microdeed/design_system/styles.dart';

class ImpactPage extends StatelessWidget {
  const ImpactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DSColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Spacers.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("My impact", style: Styles.headingGeneral),
              const SizedBox(height: Spacers.md),
              
              // Main Achievement Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(Spacers.xl),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Spacers.lg),
                   border: Border.all(color: DSColors.borders),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                       child: Container(
                         padding: const EdgeInsets.symmetric(horizontal: Spacers.sm, vertical: 2),
                         decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(12)),
                         child: const Text("NEW!", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                       ),
                    ),
                    // Hexagon Placeholder
                    const Icon(Icons.hexagon, size: 100, color: DSColors.ctaTeal),
                    const SizedBox(height: Spacers.md),
                    Text("Scholar Guardian", style: Styles.subheadingStrong.copyWith(fontSize: 20)),
                    const SizedBox(height: Spacers.sm),
                    Text("Completed your first academia task", style: Styles.bodyRegular.copyWith(color: DSColors.secondaryText)),
                     const SizedBox(height: Spacers.xs),
                    Text("Earned Dec 13, 2024", style: Styles.captionMedium.copyWith(color: DSColors.secondaryText)),
                  ],
                ),
              ),
              
               const SizedBox(height: Spacers.lg),
               
               // Total Time
               Container(
                 width: double.infinity,
                 padding: const EdgeInsets.all(Spacers.xl),
                 decoration: BoxDecoration(
                   color: DSColors.ctaTeal,
                   borderRadius: BorderRadius.circular(Spacers.lg),
                 ),
                 child: Column(
                   children: [
                     Text("TOTAL TIME CONTRIBUTED", style: Styles.microSmall.copyWith(color: Colors.white70, letterSpacing: 1.2)),
                      const SizedBox(height: Spacers.sm),
                     const FittedBox(
                       fit: BoxFit.scaleDown,
                       child: Text("2h 30m", style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold)),
                     ),
                     const SizedBox(height: Spacers.sm),
                     Text("Across 15 micro-tasks", style: Styles.bodyRegular.copyWith(color: Colors.white)),
                   ],
                 ),
               ),
               
               const SizedBox(height: Spacers.lg),
               
               // Next Achievement
               Container(
                 padding: const EdgeInsets.all(Spacers.md),
                 decoration: BoxDecoration(
                   color: Colors.white,
                    borderRadius: BorderRadius.circular(Spacers.lg),
                     border: Border.all(color: DSColors.borders),
                 ),
                 child: Row(
                   children: [
                     Container(
                       padding: const EdgeInsets.all(Spacers.sm),
                       decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFF0F0F0)),
                       child: const Icon(Icons.lock, color: Colors.grey),
                     ),
                     const SizedBox(width: Spacers.md),
                     Expanded(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text("NEXT ACHIEVEMENT", style: Styles.microSmall.copyWith(color: DSColors.secondaryText)),
                           const SizedBox(height: Spacers.xs),
                           Text("1-Hour Helper", style: Styles.subheadingStrong),
                           Text("Contribute 3 hours total", style: Styles.captionMedium.copyWith(color: DSColors.secondaryText)),
                           const SizedBox(height: Spacers.sm),
                            ClipRRect(
                               borderRadius: BorderRadius.circular(4),
                               child: LinearProgressIndicator(
                                 value: 0.8,
                                 backgroundColor: DSColors.borders,
                                 valueColor: const AlwaysStoppedAnimation<Color>(DSColors.ctaTeal),
                                 minHeight: 8,
                               ),
                             ),
                              const SizedBox(height: Spacers.xs),
                              Text("30 minutes to go!", style: Styles.microSmall.copyWith(color: DSColors.secondaryText)),
                         ],
                       ),
                     )
                   ],
                 ),
               )
            ],
          ),
        ),
      ),
    );
  }
}
