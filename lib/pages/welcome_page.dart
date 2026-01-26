import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:microdeed/design_system/colors.dart';
import 'package:microdeed/design_system/spacers.dart';
import 'package:microdeed/design_system/styles.dart';
import 'package:microdeed/pages/interest_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/welcome_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          
          // Content Overlay
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Spacers.lg),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Spacer(),
                  // Main Title
                  Text(
                    '10 Minutes.',
                    style: Styles.displayBold.copyWith(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: Spacers.sm),
                  
                  // Subtitle
                  Text(
                    'Maximum Impact.\nStart Now.',
                    style: Styles.headingGeneral.copyWith(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: Spacers.x2l), // Space before info rows

                  // Info Rows
                  _buildInfoRow(
                    icon: Icons.check_circle_outline,
                    text: 'Join 50,000+ volunteers',
                    color: DSColors.success,
                  ),
                  const SizedBox(height: Spacers.sm),
                  _buildInfoRow(
                    icon: Icons.location_on_outlined,
                    text: '8 opportunities within 1.5 miles',
                    color: Colors.grey, 
                  ),
                  
                  const SizedBox(height: Spacers.x2l),

                  // Action Button
                  ElevatedButton(
                    onPressed: () => _handleStart(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: DSColors.ctaTeal,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 20), // Height 64 approx
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Spacers.xl),
                      ),
                      textStyle: Styles.bodyRegular.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: Spacers.mmd,
                      ),
                    ),
                    child: const Text('Find My First 10-Minute Task'),
                  ),
                  
                  const SizedBox(height: Spacers.lg),

                  // Footer Link
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'How it works',
                      style: Styles.bodyRegular.copyWith(
                        color: DSColors.secondaryText,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(height: Spacers.xl),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleStart(BuildContext context) async {
    // 1. Request Location Permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Handle denied permission (optional: show snackbar)
        return; 
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      // Handle denied forever
      return;
    }

    // 2. Lateral Slide Transition to InterestPage
    if (context.mounted) {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const InterestPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0); // Slide from right
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
      );
    }
  }

  Widget _buildInfoRow({required IconData icon, required String text, required Color color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: Spacers.base),
        Text(
          text,
          style: Styles.bodyRegular.copyWith(color: DSColors.secondaryText),
        ),
      ],
    );
  }
}
