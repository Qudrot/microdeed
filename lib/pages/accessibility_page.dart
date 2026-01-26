import 'package:flutter/material.dart';
import 'package:microdeed/design_system/colors.dart';
import 'package:microdeed/design_system/spacers.dart';
import 'package:microdeed/design_system/styles.dart';

class AccessibilityPage extends StatefulWidget {
  const AccessibilityPage({super.key});

  @override
  State<AccessibilityPage> createState() => _AccessibilityPageState();
}

class _AccessibilityPageState extends State<AccessibilityPage> {
  bool _darkMode = false;
  bool _highContrast = false;
  bool _reduceMotion = false;
  bool _hapticFeedback = true;
  bool _dyslexiaFont = false;
  bool _voiceGuidance = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: DSColors.primaryText),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Accessibility",
          style: Styles.headingGeneral.copyWith(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: Spacers.md),
            // Hero Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: Spacers.lg),
              padding: const EdgeInsets.all(Spacers.xl),
              decoration: BoxDecoration(
                color: const Color(0xFFE0F2F1), // Light Teal
                borderRadius: BorderRadius.circular(Spacers.lg),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: DSColors.ctaTeal,
                    child: Icon(Icons.accessibility, color: Colors.white, size: 30),
                  ),
                  const SizedBox(height: Spacers.lg),
                  Text(
                    "We're committed to accessibility",
                    style: Styles.headingGeneral.copyWith(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: Spacers.sm),
                  Text(
                    "Customize Impact Now to work best for you. All settings sync across your devices.",
                    style: Styles.bodyRegular.copyWith(color: DSColors.secondaryText),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: Spacers.xl),

            // Settings Container
            Container(
              margin: const EdgeInsets.symmetric(horizontal: Spacers.lg),
              padding: const EdgeInsets.all(Spacers.md),
              decoration: BoxDecoration(
                border: Border.all(color: DSColors.borders),
                borderRadius: BorderRadius.circular(Spacers.lg),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Visual Display", style: Styles.subheadingStrong),
                  const SizedBox(height: Spacers.lg),
                  
                  _buildSwitch(
                    "Dark Mode", 
                    "Reduce eye strain in low-light environments", 
                    _darkMode, 
                    (v) => setState(() => _darkMode = v)
                  ),
                  const Divider(height: Spacers.xl),
                   _buildSwitch(
                    "High Contrast Mode", 
                    "Enhance color contrast for better readability", 
                    _highContrast, 
                    (v) => setState(() => _highContrast = v)
                  ),
                   const Divider(height: Spacers.xl),
                   _buildSwitch(
                    "Reduce Motion", 
                    "Minimize animations and transitions", 
                    _reduceMotion, 
                    (v) => setState(() => _reduceMotion = v)
                  ),
                  
                  const Divider(height: Spacers.xl),
                  
                  // Text Size Selector
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Text Size", style: Styles.bodyRegular.copyWith(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 4),
                      Text("Adjust text size for comfortable reading", style: Styles.microSmall.copyWith(color: DSColors.secondaryText)),
                      const SizedBox(height: Spacers.md),
                      Row(
                        children: [
                          _buildTextSizeButton("Aa", 0, false),
                          const SizedBox(width: Spacers.md),
                          _buildTextSizeButton("Aa", 1, true), // Medium selected
                          const SizedBox(width: Spacers.md),
                          _buildTextSizeButton("Aa", 2, false),
                        ],
                      ),
                    ],
                  ),
                  
                  const Divider(height: Spacers.xl),
                  
                  _buildSwitch(
                    "Dyslexia-Friendly Font", 
                    "Use OpenDyslexic font for easier reading", 
                    _dyslexiaFont, 
                    (v) => setState(() => _dyslexiaFont = v)
                  ),
                ],
              ),
            ),
            
             const SizedBox(height: Spacers.lg),

             Container(
              margin: const EdgeInsets.symmetric(horizontal: Spacers.lg),
              padding: const EdgeInsets.all(Spacers.md),
              decoration: BoxDecoration(
                border: Border.all(color: DSColors.borders),
                borderRadius: BorderRadius.circular(Spacers.lg),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Audio & Haptics", style: Styles.subheadingStrong),
                  const SizedBox(height: Spacers.lg),
                  
                  _buildSwitch(
                    "Haptic Feedback", 
                    "Enable vibrations for interactions", 
                    _hapticFeedback, 
                    (v) => setState(() => _hapticFeedback = v)
                  ),
                  const Divider(height: Spacers.xl),
                  _buildSwitch(
                    "Voice Guidance",
                    "Spoken instructions during tasks",
                    _voiceGuidance,
                    (v) => setState(() => _voiceGuidance = v),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: Spacers.x3l),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitch(String title, String subtitle, bool value, Function(bool) onChanged) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Styles.bodyRegular.copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              Text(subtitle, style: Styles.microSmall.copyWith(color: DSColors.secondaryText)),
            ],
          ),
        ),
        const SizedBox(width: Spacers.md),
        Switch(
          value: value, 
          onChanged: onChanged,
          activeTrackColor: DSColors.ctaTeal,
        ),
      ],
    );
  }

  Widget _buildTextSizeButton(String label, int index, bool isSelected) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? DSColors.ctaTeal : Colors.white,
          borderRadius: BorderRadius.circular(Spacers.sm),
          border: Border.all(color: isSelected ? DSColors.ctaTeal : DSColors.borders),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14.0 + (index * 2), // 14, 16, 18
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : DSColors.primaryText,
            ),
          ),
        ),
      ),
    );
  }
}
