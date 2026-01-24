import 'package:flutter/material.dart';
import 'package:microdeed/design_system/colors.dart';
import 'package:microdeed/design_system/spacers.dart';
import 'package:microdeed/design_system/styles.dart';
import 'package:microdeed/pages/opportunity_page.dart';

class ReflectionPage extends StatelessWidget {
  const ReflectionPage({super.key});

  void _navigateToMain(BuildContext context, int tabIndex) {
     // Navigate to OpportunityPage (which acts as Main shell) and set index
     // Since OpportunityPage currently doesn't support setting index via constructor,
     // we might need to modify it or assume we push it new.
     // For now, pushing new replacement.
     Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => OpportunityPage(initialIndex: tabIndex)),
        (route) => false,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DSColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Spacers.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Lightbulb Icon
              Container(
                padding: const EdgeInsets.all(Spacers.xl),
                decoration: BoxDecoration(
                  color: Colors.purple[50],
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.lightbulb, size: 80, color: Colors.purpleAccent),
              ),
              const SizedBox(height: Spacers.x2l),
              
              Text(
                "How did that 10 minutes feel?",
                textAlign: TextAlign.center,
                style: Styles.headingGeneral.copyWith(fontSize: 28),
              ),
              const SizedBox(height: Spacers.md),
               Text(
                "Your feedback helps us refine future tasks and improve Impact Now for everyone.",
                textAlign: TextAlign.center,
                style: Styles.bodyRegular.copyWith(color: DSColors.secondaryText),
              ),
              
              const SizedBox(height: Spacers.x2l),
              
              // Emojis Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildEmojiOption("🤩", "Amazing!", true),
                  _buildEmojiOption("👍", "Good", false),
                  _buildEmojiOption("😐", "Okay", false),
                  _buildEmojiOption("🤔", "Challenging", false),
                ],
              ),
               const SizedBox(height: Spacers.lg),
                _buildEmojiOption("😓", "Too Long", false),
              
              const Spacer(),
              
              // Submit
               SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _navigateToMain(context, 2), // Impact Tab (Index 2 in BottomNav)
                  style: ElevatedButton.styleFrom(
                    backgroundColor: DSColors.borders, // Grey for disabled-look or just light
                    foregroundColor: Colors.white, // Text color
                     padding: const EdgeInsets.symmetric(vertical: Spacers.md),
                     elevation: 0,
                  ),
                   // Screenshot shows a light grey button "Submit Feedback"
                   // and a link "Skip for now"
                  child: const Text("Submit Feedback", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: Spacers.md),
              TextButton(
                onPressed: () => _navigateToMain(context, 1), // Activity Tab (Index 1) - Prompt said "Activity" when skip
                child: Text("Skip for now", style: Styles.bodyRegular.copyWith(color: DSColors.purpleMain)),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildEmojiOption(String emoji, String label, bool isSelected) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(Spacers.md),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Spacers.md),
            border: Border.all(color: isSelected ? Colors.purple : DSColors.borders),
            boxShadow: isSelected ? [BoxShadow(color: Colors.purple.withOpacity(0.1), blurRadius: 10)] : null,
          ),
          child: Text(emoji, style: const TextStyle(fontSize: 32)),
        ),
        const SizedBox(height: Spacers.xs),
        Text(label, style: Styles.captionMedium.copyWith(color: DSColors.secondaryText)),
      ],
    );
  }
}
