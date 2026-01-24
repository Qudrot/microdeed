import 'package:flutter/material.dart';
import 'package:microdeed/design_system/colors.dart';
import 'package:microdeed/design_system/spacers.dart';
import 'package:microdeed/design_system/styles.dart';
import 'package:microdeed/pages/directions_page.dart';

class OpportunityDetailPage extends StatelessWidget {
  const OpportunityDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 1. Header Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.35, // Approx 35% height
            child: Image.asset(
              'assets/images/book.png',
              fit: BoxFit.cover,
            ),
          ),

          // 2. Custom App Bar over Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Spacers.md, vertical: Spacers.sm),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back Button
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: DSColors.primaryText),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    // Bookmark Button
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(Icons.bookmark_border, color: DSColors.primaryText),
                        onPressed: () {
                          // TODO: Handle save
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 3. DraggableScrollableSheet or just simple positioned container for content
          // Using a simple Container with rounded corners to overlay the image at the bottom
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3, // Overlap slightly
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Spacers.lg),
                  topRight: Radius.circular(Spacers.lg),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(Spacers.lg),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Badge: City Library
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: Spacers.sm, vertical: Spacers.xs),
                            decoration: BoxDecoration(
                              color: DSColors.tealLight,
                              borderRadius: BorderRadius.circular(Spacers.xl),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'City Library',
                                  style: Styles.captionMedium.copyWith(color: DSColors.tealMain, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: Spacers.xs),
                                const Icon(Icons.check_circle, size: 16, color: DSColors.tealMain),
                              ],
                            ),
                          ),
                          const SizedBox(height: Spacers.md),

                          // Title
                          Text(
                            'Sort donated books',
                            style: Styles.headingGeneral.copyWith(fontSize: 28),
                          ),
                          const SizedBox(height: Spacers.lg),

                          // Stats Card
                          Container(
                            padding: const EdgeInsets.all(Spacers.md),
                            decoration: BoxDecoration(
                              color: DSColors.tealLight.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(Spacers.md),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const CircleAvatar(
                                      backgroundColor: DSColors.ctaTeal,
                                      radius: 16,
                                      child: Icon(Icons.access_time, color: Colors.white, size: 20),
                                    ),
                                    Text(
                                      '247 VOLUNTEERS',
                                      style: Styles.microSmall.copyWith(
                                        color: DSColors.ctaTeal,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.0,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: Spacers.md),
                                Text(
                                  'TIME-TESTED AVERAGE',
                                  style: Styles.microSmall.copyWith(color: DSColors.secondaryText),
                                ),
                                const SizedBox(height: Spacers.xs),
                                Text(
                                  '8 min 42 sec',
                                  style: Styles.displayBold.copyWith(color: DSColors.ctaTeal, fontSize: 32),
                                ),
                                const SizedBox(height: Spacers.md),
                                Text(
                                  '243 of 247',
                                  style: Styles.captionMedium.copyWith(color: DSColors.secondaryText),
                                ),
                                const SizedBox(height: Spacers.xs),
                                // Progress Bar
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: LinearProgressIndicator(
                                    value: 243 / 247,
                                    backgroundColor: Colors.white,
                                    valueColor: const AlwaysStoppedAnimation<Color>(DSColors.ctaTeal),
                                    minHeight: 8,
                                  ),
                                ),
                                const SizedBox(height: Spacers.xs),
                                Text(
                                  'completed within 10 minutes',
                                  style: Styles.captionMedium.copyWith(color: DSColors.secondaryText),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: Spacers.lg),

                          // Tag Pills Row
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                _buildPill(
                                  text: '10 MIN',
                                  backgroundColor: DSColors.ctaTeal,
                                  textColor: Colors.white,
                                ),
                                const SizedBox(width: Spacers.sm),
                                _buildPill(
                                  text: '0.3 mi away',
                                  backgroundColor: Colors.white,
                                  textColor: DSColors.primaryText,
                                  borderColor: DSColors.borders,
                                ),
                                const SizedBox(width: Spacers.sm),
                                _buildPill(
                                  text: '2 spots left',
                                  backgroundColor: const Color(0xFFFFE4E6), // Light red/pink
                                  textColor: const Color(0xFFF43F5E), // Red/Pink text
                                ),
                                const SizedBox(width: Spacers.sm),
                                _buildPill(
                                  text: 'Today 3:00 PM',
                                  backgroundColor: Colors.white,
                                  textColor: DSColors.primaryText,
                                  borderColor: DSColors.borders,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: Spacers.xl),

                          // About Section
                          Text(
                            'About this deed',
                            style: Styles.subheadingStrong,
                          ),
                          const SizedBox(height: Spacers.sm),
                          Text(
                            'Join us for a quick sorting session of donated books. Your 10 minutes help our community library serve more families and promote literacy.',
                            style: Styles.bodyRegular.copyWith(color: DSColors.secondaryText),
                          ),
                          const SizedBox(height: Spacers.x3l), // Space for bottom button
                        ],
                      ),
                    ),
                  ),

                  // Bottom Action Button
                  Padding(
                    padding: const EdgeInsets.all(Spacers.lg),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const DirectionsPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: DSColors.ctaTeal,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: Spacers.md),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Spacers.xl),
                          ),
                          textStyle: Styles.bodyRegular.copyWith(fontWeight: FontWeight.bold),
                        ),
                        child: const Text('Accept Opportunity'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPill({
    required String text,
    required Color backgroundColor,
    required Color textColor,
    Color? borderColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Spacers.md, vertical: Spacers.sm),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(Spacers.lg),
        border: borderColor != null ? Border.all(color: borderColor) : null,
      ),
      child: Text(
        text,
        style: Styles.captionMedium.copyWith(color: textColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}