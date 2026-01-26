import 'package:flutter/material.dart';
import 'package:microdeed/design_system/colors.dart';
import 'package:microdeed/design_system/spacers.dart';
import 'package:microdeed/design_system/styles.dart';

class ShareImpactPage extends StatelessWidget {
  const ShareImpactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: DSColors.primaryText),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          "Share Your Impact",
          style: Styles.headingGeneral.copyWith(fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(Spacers.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Share Your Latest Impact!",
                      style: Styles.subheadingStrong.copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: Spacers.xs),
                    Text(
                      "Let your network know about the positive change you're making in your community.",
                      style: Styles.bodyRegular.copyWith(
                        color: DSColors.secondaryText,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: Spacers.lg),

                    // Impact Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: Spacers.x2l,
                        horizontal: Spacers.lg,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF8F6), // Light Teal/Mint background
                        borderRadius: BorderRadius.circular(Spacers.lg),
                      ),
                      child: Column(
                        children: [
                          // Bear Icon / Avatar
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.cruelty_free, // Closest to a bear/animal in Material? Or face
                                size: 40,
                                color: DSColors.ctaTeal,
                              ),
                            ),
                          ),
                          const SizedBox(height: Spacers.lg),
                          Text(
                            "I just volunteered for 10 minutes!",
                            textAlign: TextAlign.center,
                            style: Styles.headingGeneral.copyWith(fontSize: 18),
                          ),
                          const SizedBox(height: Spacers.sm),
                          Text(
                            "Small acts of kindness can create big ripples. Join me!",
                            textAlign: TextAlign.center,
                            style: Styles.bodyRegular.copyWith(
                              color: DSColors.secondaryText,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: Spacers.md),
                          Text(
                            "#ImpactNow",
                            style: Styles.subheadingStrong.copyWith(
                              color: DSColors.ctaTeal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: Spacers.x2l),

                    // Social Share Buttons Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _SocialButton(
                          color: const Color(0xFF1877F2), // Facebook Blue
                          icon: Icons.facebook,
                        ),
                        const SizedBox(width: Spacers.md),
                        _SocialButton(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF833AB4),
                              Color(0xFFFD1D1D),
                              Color(0xFFFCAF45),
                            ], // Instagram Gradient
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          icon: Icons.camera_alt_outlined, // Instagram proxy
                        ),
                        const SizedBox(width: Spacers.md),
                        _SocialButton(
                          color: const Color(0xFF1DA1F2), // Twitter Blue
                          icon: Icons.alternate_email, // Twitter proxy (bird not in basic Icons)
                        ),
                        const SizedBox(width: Spacers.md),
                        _SocialButton(
                          color: const Color(0xFF0077B5), // LinkedIn Blue
                          icon: Icons.business_center, // LinkedIn proxy
                        ),
                        const SizedBox(width: Spacers.md),
                        _SocialButton(
                          color: const Color(0xFF25D366), // WhatsApp Green
                          icon: Icons.chat_bubble_outline, // WhatsApp proxy
                          isLast: true, // Just for visual consistency if needed
                        ),
                      ],
                    ),
                    const SizedBox(height: Spacers.xl),

                    // Copy Link Button
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.link),
                        label: const Text("Copy Share Link"),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: DSColors.primaryText,
                          padding: const EdgeInsets.symmetric(vertical: Spacers.md),
                          side: const BorderSide(color: DSColors.borders),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Spacers.xl),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: Spacers.md),

                    // Generate Image Button
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.image),
                        label: const Text("Generate Image for Stories"),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: DSColors.primaryText,
                          padding: const EdgeInsets.symmetric(vertical: Spacers.md),
                          side: const BorderSide(color: DSColors.borders),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Spacers.xl),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: Spacers.x2l),
                    
                    // Invite Section
                    Text(
                      "Invite Your Friends",
                      style: Styles.subheadingStrong,
                    ),
                    const SizedBox(height: Spacers.sm),
                    Text(
                      "Volunteering is always more fun and impactful when you do it with friends!",
                      style: Styles.bodyRegular.copyWith(color: DSColors.secondaryText),
                    ),
                    const SizedBox(height: Spacers.lg),
                    
                    // Invite Contacts Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.person_add),
                        label: const Text("Invite from Contacts"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: DSColors.ctaTeal,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: Spacers.md),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Spacers.xl),
                          ),
                          elevation: 0,
                        ),
                      ),
                    ),
                    const SizedBox(height: Spacers.lg),

                    // Referral Code Box
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: Spacers.lg),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFAFAFA),
                        borderRadius: BorderRadius.circular(Spacers.md),
                        border: Border.all(
                          color: DSColors.borders, // Should be dashed ideally, but solid for now
                          style: BorderStyle.solid, 
                        ),
                      ),
                      // Dashed border effect would require a custom painter, sticking to solid for simplicity or use a library if available. 
                      // Design shows dashed. I'll stick to a light solid border to avoid custom painter complexity unless requested.
                      child: Center(
                        child: Text(
                          "VOLUNTEER567",
                          style: Styles.headingGeneral.copyWith(
                            color: DSColors.ctaTeal,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: Spacers.x2l),

            // Share Invite Button (New Design)
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.share, size: 20),
                label: const Text("Share Invite"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: DSColors.purpleMain,
                  padding: const EdgeInsets.symmetric(vertical: Spacers.md),
                  side: const BorderSide(color: DSColors.purpleMain, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Spacers.xl),
                  ),
                  textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: Spacers.lg),

            // Team Player Reward Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(Spacers.xl),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9), // Light Green background similar to screenshot
                borderRadius: BorderRadius.circular(Spacers.lg),
                border: Border.all(color: DSColors.green),
              ),
              child: Column(
                children: [
                  // Badge Icon with Ribbon
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                       Container(
                         width: 64,
                         height: 64,
                         margin: const EdgeInsets.only(bottom: 10),
                         decoration: BoxDecoration(
                           color: Colors.white,
                           shape: BoxShape.circle,
                           border: Border.all(color: DSColors.ctaTeal, width: 4),
                         ),
                         child: const Icon(Icons.people, color: DSColors.ctaTeal, size: 32),
                       ),
                       // Ribbon effect (simplified with Container)
                       Positioned(
                         bottom: 0,
                         child: Container(
                           width: 24,
                           height: 24,
                           decoration: const BoxDecoration(
                             color: DSColors.purpleMain,
                             shape: BoxShape.rectangle, // Would need custom clipper for ribbon shape
                           ),
                            child: const Icon(Icons.bookmark, color: Colors.white, size: 16), // Placeholder for ribbon tail
                         ),
                       ),
                    ],
                  ),
                  const SizedBox(height: Spacers.md),
                  
                  Text(
                    "Earn this when a friend joins!",
                    style: Styles.subheadingStrong.copyWith(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: Spacers.sm),
                  Text(
                    "Unlock the exclusive 'Team Player' badge when your friend completes their first task.",
                    style: Styles.bodyRegular.copyWith(color: DSColors.secondaryText),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            
            // Bottom Navigation Bar (Visual Only)
            Container(
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: DSColors.borders)),
              ),
              child: BottomNavigationBar(
                currentIndex: 2, // Impact selected
                selectedItemColor: DSColors.ctaTeal,
                unselectedItemColor: DSColors.secondaryText,
                showUnselectedLabels: true,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                elevation: 0,
                onTap: (index){
                   // No op for this static page or add simple nav back
                   if (index == 3) {
                      // Maybe navigate to profile
                   }
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.explore_outlined),
                    label: "Discover",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.show_chart),
                    label: "Activity",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.emoji_events),
                    label: "Impact",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline),
                    label: "Profile",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final Color? color;
  final Gradient? gradient;
  final IconData icon;
  final bool isLast;

  const _SocialButton({
    this.color,
    this.gradient,
    required this.icon,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 24),
    );
  }
}


