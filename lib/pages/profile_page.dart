import 'package:flutter/material.dart';
import 'package:microdeed/design_system/colors.dart';
import 'package:microdeed/design_system/spacers.dart';
import 'package:microdeed/design_system/styles.dart';
import 'package:microdeed/pages/welcome_page.dart';
import 'package:microdeed/pages/help_support_page.dart';
import 'package:microdeed/pages/accessibility_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DSColors.background, // Pale green background as per screens
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: Spacers.xl),

              // --- Header ---
              Center(
                child: Column(
                  children: [
                    // Avatar
                    Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: DSColors.ctaTeal,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          "CR",
                          style: Styles.headingGeneral.copyWith(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: Spacers.md),
                    
                    // Name
                    Text(
                      "Chris Rodriguez",
                      style: Styles.headingGeneral.copyWith(fontSize: 22),
                    ),
                    const SizedBox(height: Spacers.xs),
                    Text(
                      "Volunteer since Dec 2024",
                      style: Styles.bodyRegular.copyWith(color: DSColors.secondaryText),
                    ),
                    const SizedBox(height: Spacers.lg),

                    // Quick Actions / Badges
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildQuickAction(Icons.description),
                        const SizedBox(width: Spacers.md),
                        _buildQuickAction(Icons.check),
                        const SizedBox(width: Spacers.md),
                        _buildQuickAction(Icons.emoji_emotions),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: Spacers.xl),

              // --- PERSONAL GOALS ---
              _buildSectionHeader("PERSONAL GOALS"),
              _buildCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Weekly Time Goal", style: Styles.subheadingStrong),
                    const SizedBox(height: Spacers.md),
                    // Check screenshot, it's a slider with a knob
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: DSColors.borders, // Light grey track
                        inactiveTrackColor: DSColors.borders,
                        thumbColor: DSColors.ctaTeal,
                        overlayColor: DSColors.ctaTeal.withValues(alpha: 0.2),
                        trackHeight: 6.0,
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      ),
                      child: Slider(
                        value: 0,
                        min: 0,
                        max: 30,
                        onChanged: (val) {},
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                              style: Styles.bodyRegular.copyWith(color: DSColors.secondaryText),
                              children: [
                                TextSpan(text: "0", style: TextStyle(color: DSColors.ctaTeal, fontWeight: FontWeight.bold)),
                                const TextSpan(text: "/30 min this week"),
                              ],
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: Spacers.sm),
                        Text("30 min", style: Styles.bodyRegular.copyWith(color: DSColors.secondaryText)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: Spacers.md),
              
              _buildCard(
                child: Row(
                  children: [
                    const Icon(Icons.local_fire_department, color: Colors.orange, size: 32),
                    const SizedBox(width: Spacers.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("5 Day Streak", style: Styles.subheadingStrong),
                          Text("Keep it going!", style: Styles.captionMedium.copyWith(color: DSColors.secondaryText)),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right, color: DSColors.borders),
                  ],
                ),
              ),

              const SizedBox(height: Spacers.xl),

              // --- MY ACTIVITY ---
              _buildSectionHeader("MY ACTIVITY"),
              _buildMenuCard([
                _buildMenuItem(
                  icon: Icons.show_chart,
                  title: "Activity Log",
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.emoji_events,
                  title: "My Impact",
                  onTap: () {},
                  showDivider: false, // Last item
                ),
              ]),

              const SizedBox(height: Spacers.xl),

              // --- ACCOUNT ---
              _buildSectionHeader("ACCOUNT"),
              _buildMenuCard([
                 _buildMenuItem(
                  icon: Icons.person,
                  title: "Edit Profile",
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.notifications,
                  title: "Notification Preferences",
                  onTap: () {},
                  showDivider: false,
                ),
              ]),
              
              const SizedBox(height: Spacers.xl),

              // --- PREFERENCES ---
              _buildSectionHeader("PREFERENCES"),
              _buildMenuCard([
                _buildMenuItem(
                  icon: Icons.accessibility_new,
                  title: "Accessibility Settings",
                   // Screenshot shows icon background
                  customIcon: CircleAvatar(
                    backgroundColor: DSColors.ctaTeal,
                    radius: 16,
                    child: const Icon(Icons.accessibility_new, color: Colors.white, size: 18),
                  ),
                  onTap: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AccessibilityPage()),
                    );
                  },
                  showDivider: false,
                ),
              ]),

              const SizedBox(height: Spacers.xl),
              
               // --- HELP & SUPPORT ---
              _buildSectionHeader("HELP & SUPPORT"),
              _buildMenuCard([
                 _buildMenuItem(
                  icon: Icons.help_outline,
                  title: "Help & Support Center",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HelpSupportPage()),
                    );
                  },
                ),
                _buildMenuItem(
                  icon: Icons.flag,
                  title: "Report an Issue",
                  onTap: () {},
                  showDivider: false,
                ),
              ]),
              
              const SizedBox(height: Spacers.xl),

               // --- LEGAL ---
              _buildSectionHeader("LEGAL"),
              _buildMenuCard([
                 _buildMenuItem(
                  icon: Icons.lock,
                  title: "Privacy Policy",
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.description,
                  title: "Terms of Service",
                  onTap: () {},
                  showDivider: false,
                ),
              ]),

              const SizedBox(height: Spacers.xl),

              // Logout Button
              TextButton(
                onPressed: () {
                  // Navigate to Welcome Page (acting as Logout)
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const WelcomePage()),
                    (route) => false,
                  );
                },
                child: Text(
                  "Log Out",
                  style: Styles.bodyRegular.copyWith(
                    color: DSColors.urgency, // Red color
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              
              const SizedBox(height: Spacers.x2l),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickAction(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(Spacers.sm),
      decoration: const BoxDecoration(
        color: DSColors.ctaTeal,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacers.lg, vertical: Spacers.sm),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: Styles.captionMedium.copyWith(
            color: DSColors.secondaryText,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Spacers.lg),
      padding: const EdgeInsets.all(Spacers.lg),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Spacers.md),
        border: Border.all(color: DSColors.borders.withValues(alpha: 0.5)), // Very subtle
      ),
      child: child,
    );
  }

  Widget _buildMenuCard(List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Spacers.lg),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Spacers.md),
        border: Border.all(color: DSColors.borders.withValues(alpha: 0.5)),
      ),
      child: Column(children: children),
    );
  }
  
  Widget _buildMenuItem({
    IconData? icon,
    Widget? customIcon,
    required String title,
    required VoidCallback onTap,
    bool showDivider = true,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(Spacers.md),
        child: Column(
          children: [
            Row(
              children: [
                if (customIcon != null)
                   customIcon
                else if (icon != null)
                   CircleAvatar(
                    backgroundColor: const Color(0xFFE0F2F1), // Light teal bg
                    radius: 18,
                    child: Icon(icon, color: DSColors.ctaTeal, size: 20),
                  ),
                const SizedBox(width: Spacers.md),
                Expanded(
                  child: Text(title, style: Styles.bodyRegular.copyWith(fontWeight: FontWeight.w600)),
                ),
                const Icon(Icons.chevron_right, color: DSColors.secondaryText),
              ],
            ),
            if (showDivider) ...[
               const SizedBox(height: Spacers.sm),
               const Divider(height: 1, indent: 50),
            ]
          ],
        ),
      ),
    );
  }
}
