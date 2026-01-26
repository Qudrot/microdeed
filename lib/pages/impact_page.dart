import 'package:flutter/material.dart';
import 'package:microdeed/design_system/colors.dart';
import 'package:microdeed/design_system/spacers.dart';
import 'package:microdeed/design_system/styles.dart';
import 'package:microdeed/pages/share_impact_page.dart';

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
               ),

           const SizedBox(height: Spacers.x2l),

           // Your Badges Section
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Your Badges", style: Styles.headingGeneral.copyWith(fontSize: 22)),
                Text("3 / 12 earned", style: Styles.bodyRegular.copyWith(color: DSColors.secondaryText)),
              ],
           ),
           const SizedBox(height: Spacers.lg),
           
           // Badges Grid
           GridView.count(
             crossAxisCount: 3,
             shrinkWrap: true,
             physics: const NeverScrollableScrollPhysics(),
             mainAxisSpacing: Spacers.lg,
             crossAxisSpacing: Spacers.md,
             childAspectRatio: 0.7,
             children: [
                _BadgeItem(icon: Icons.shield, color: DSColors.ctaTeal, label: "First Responder"),
                _BadgeItem(icon: Icons.hexagon_outlined, color: DSColors.ctaTeal, label: "Scholar Guardian", isFilled: false), // Using outlined as closest to shape
                _BadgeItem(icon: Icons.face, color: DSColors.ctaTeal, label: "Community Helper"),
                _BadgeItem(icon: Icons.home_filled, color: DSColors.inactive.withValues(alpha: 0.3), label: "???", isLocked: true), // Placeholder shape
                _BadgeItem(icon: Icons.lock, color: DSColors.inactive.withValues(alpha: 0.3), label: "???", isLocked: true), // Placeholder
                _BadgeItem(icon: Icons.circle, color: DSColors.inactive.withValues(alpha: 0.3), label: "???", isLocked: true), // Placeholder
                _BadgeItem(icon: Icons.star, color: DSColors.inactive.withValues(alpha: 0.3), label: "???", isLocked: true),
                _BadgeItem(icon: Icons.egg, color: DSColors.inactive.withValues(alpha: 0.3), label: "???", isLocked: true),
                _BadgeItem(icon: Icons.battery_std, color: DSColors.inactive.withValues(alpha: 0.3), label: "???", isLocked: true),
             ],
           ),

           const SizedBox(height: Spacers.x2l),
           
           // Bottom Buttons
           SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ShareImpactPage()),
                    );
                },
                icon: const Icon(Icons.share, size: 20),
                label: const Text("Share Your Impact"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: DSColors.ctaTeal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: Spacers.md),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Spacers.xl),
                  ),
                  elevation: 0,
                  textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: Spacers.md),
            
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                   // Navigate to find opportunity
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: DSColors.purpleMain,
                  padding: const EdgeInsets.symmetric(vertical: Spacers.md),
                  side: const BorderSide(color: DSColors.purpleMain, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Spacers.xl),
                  ),
                   textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                child: const Text("Find Next Opportunity"),
              ),
            ),
            const SizedBox(height: Spacers.x2l),
            ],
          ),
        ),
      ),
    );
  }
}

class _BadgeItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final bool isLocked;
  final bool isFilled;

  const _BadgeItem({
    required this.icon,
    required this.color,
    required this.label,
    this.isLocked = false,
    this.isFilled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isLocked ? const Color(0xFFF0F0F0) : (isFilled ? color : Colors.transparent),
             border: isFilled || isLocked ? null : Border.all(color: color, width: 6), // Creating a thick border for outlined look
          ),
          child: Center(
            child: Icon(
              icon, 
              color: isLocked ? Colors.white : (isFilled ? Colors.white : color), 
              size: 32,
            ),
          ),
        ),
        const SizedBox(height: Spacers.sm),
        Text(
          label, 
          textAlign: TextAlign.center,
          style: Styles.microSmall.copyWith(
            color: isLocked ? DSColors.inactive : DSColors.primaryText,
            fontWeight: isLocked ? FontWeight.normal : FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
