import 'package:flutter/material.dart';
import 'package:microdeed/design_system/colors.dart';
import 'package:microdeed/design_system/spacers.dart';
import 'package:microdeed/design_system/styles.dart';
import 'package:microdeed/pages/reflection_page.dart';

class CompletionPage extends StatelessWidget {
  const CompletionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF243441), // Carbon/Dark background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Spacers.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Badge Animation / Graphic
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: DSColors.tealMain.withOpacity(0.2),
                  border: Border.all(color: DSColors.tealMain.withOpacity(0.5)),
                ),
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Glow effect
                      Container(
                         width: 160,
                         height: 160,
                         decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           boxShadow: [
                             BoxShadow(
                               color: DSColors.tealMain.withOpacity(0.6),
                               blurRadius: 40,
                               spreadRadius: 10,
                             ),
                           ],
                         ),
                      ),
                      // Badge Icon Placeholder (Book/Ribbon)
                      const Icon(Icons.bookmark, size: 100, color: Colors.purpleAccent),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: Spacers.x2l),
              
              Text(
                "Badge Unlocked!",
                 style: Styles.headingGeneral.copyWith(
                   color: Colors.white,
                   fontSize: 26,
                   fontWeight: FontWeight.bold,
                 ),
              ),
              const SizedBox(height: Spacers.sm),
               Text(
                "Scholar Guardian",
                 style: Styles.subheadingStrong.copyWith(
                   color: Colors.white,
                   fontSize: 20,
                 ),
              ),
              const SizedBox(height: Spacers.sm),
               Text(
                "Completed your first academia task",
                 style: Styles.bodyRegular.copyWith(
                   color: DSColors.secondaryText,
                 ),
              ),
              
              const Spacer(),
              
              // Share Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Share logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: DSColors.ctaTeal,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: Spacers.md),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Spacers.xl),
                    ),
                  ),
                  child: const Text("Share My Achievement", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ),
              const SizedBox(height: Spacers.md),
              TextButton(
                onPressed: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ReflectionPage()),
                    );
                },
                child: Text(
                  "Continue",
                  style: Styles.bodyRegular.copyWith(color: DSColors.secondaryText),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
