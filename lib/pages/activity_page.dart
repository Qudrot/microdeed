import 'package:flutter/material.dart';
import 'package:microdeed/design_system/colors.dart';
import 'package:microdeed/design_system/spacers.dart';
import 'package:microdeed/design_system/styles.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

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
               Text("My Activity", style: Styles.headingGeneral),
               const SizedBox(height: Spacers.md),
               
               // Tabs
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildTab("All", true),
                      _buildTab("Completed", false),
                      _buildTab("Upcoming", false),
                    ],
                  ),
                ),
               const SizedBox(height: Spacers.lg),
               
               // Monthly Stats
               Container(
                 padding: const EdgeInsets.symmetric(vertical: Spacers.lg),
                 decoration: BoxDecoration(
                   color: DSColors.ctaTeal,
                   borderRadius: BorderRadius.circular(Spacers.lg),
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     _buildStat("12", "Deeds"),
                     _buildStat("2h", "Time"),
                     _buildStat("5", "Badges"),
                   ],
                 ),
               ),
               
               const SizedBox(height: Spacers.xl),
               
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text("Recent Activity", style: Styles.subheadingStrong),
                   Text("View All", style: Styles.captionMedium.copyWith(color: DSColors.ctaTeal)),
                 ],
               ),
               const SizedBox(height: Spacers.md),
               
               // List Items
               _buildActivityCard(
                 title: "Help sort donations at Food Bank",
                 subtitle: "9m 23s • City Library", // Screenshot says City Library but title says Food Bank? Just copying UI
                 time: "Today, 2:30 PM",
                 isCompleted: true,
                 badge: "New Badge Earned!",
               ),
               const SizedBox(height: Spacers.md),
               _buildActivityCard(
                 title: "Read to seniors at Willow Creek",
                 subtitle: "10 minutes • 0.8 mi away",
                 time: "Tomorrow, 10:00 AM",
                 isUpcoming: true,
               ),
             ],
           ),
        ),
      ),
    );
  }
  
  Widget _buildTab(String text, bool isActive) {
    return Container(
      margin: const EdgeInsets.only(right: Spacers.md),
      padding: const EdgeInsets.symmetric(horizontal: Spacers.lg, vertical: Spacers.xs),
      decoration: BoxDecoration(
        border: isActive ? const Border(bottom: BorderSide(color: DSColors.ctaTeal, width: 2)) : null,
      ),
      child: Text(
        text,
        style: Styles.bodyRegular.copyWith(
          color: isActive ? DSColors.ctaTeal : DSColors.secondaryText,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
  
  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(value, style: Styles.headingGeneral.copyWith(color: Colors.white)),
        Text(label, style: Styles.captionMedium.copyWith(color: Colors.white)),
      ],
    );
  }
  
  Widget _buildActivityCard({
    required String title,
    required String subtitle,
    required String time,
    bool isCompleted = false,
    bool isUpcoming = false,
    String? badge,
  }) {
    return Container(
      padding: const EdgeInsets.all(Spacers.md),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Spacers.md),
        border: Border.all(color: DSColors.borders),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (isCompleted)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: Spacers.sm, vertical: 2),
                  decoration: BoxDecoration(color: DSColors.tealLight, borderRadius: BorderRadius.circular(4)),
                  child: Row(children: [
                    const Icon(Icons.check, size: 12, color: DSColors.ctaTeal),
                    const SizedBox(width: 4),
                    Text("COMPLETED", style: Styles.microSmall.copyWith(color: DSColors.ctaTeal, fontWeight: FontWeight.bold))
                  ]),
                )
              else if (isUpcoming)
                 Container(
                  padding: const EdgeInsets.symmetric(horizontal: Spacers.sm, vertical: 2),
                  decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(4)),
                  child: Text("UPCOMING", style: Styles.microSmall.copyWith(color: Colors.blue, fontWeight: FontWeight.bold)),
                ),
                
              Text(time, style: Styles.microSmall.copyWith(color: DSColors.secondaryText)),
            ],
          ),
          const SizedBox(height: Spacers.sm),
          Text(title, style: Styles.subheadingStrong),
          const SizedBox(height: Spacers.xs),
          Row(
            children: [
              if (isUpcoming) ...[
                 const Icon(Icons.access_time, size: 14, color: DSColors.secondaryText),
                 const SizedBox(width: 4),
              ] else ... [
                 const Icon(Icons.access_time, size: 14, color: DSColors.secondaryText),
                  const SizedBox(width: 4),
              ],
              Text(subtitle, style: Styles.captionMedium.copyWith(color: DSColors.secondaryText)),
              if (isCompleted) ... [
                  const SizedBox(width: Spacers.md),
                  const Icon(Icons.location_on, size: 14, color: DSColors.secondaryText),
                  Text(" City Library", style: Styles.captionMedium.copyWith(color: DSColors.secondaryText)),
              ]
            ],
          ),
          
          if (badge != null) ...[
            const SizedBox(height: Spacers.md),
            Container(
              padding: const EdgeInsets.all(Spacers.sm),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF9E6), // Light Yellow
                borderRadius: BorderRadius.circular(Spacers.sm),
                 border: Border.all(color: Colors.orangeAccent, style: BorderStyle.solid), // Dashed borders need custom painter usually
              ),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange),
                  const SizedBox(width: Spacers.sm),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(badge, style: Styles.captionMedium.copyWith(fontWeight: FontWeight.bold)),
                      Text("10-Hour Hero unlocked", style: Styles.microSmall.copyWith(color: DSColors.secondaryText)),
                    ],
                  )
                ],
              ),
            )
          ],
            
          const SizedBox(height: Spacers.md),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(isUpcoming ? "View Details" : "Share"),
                ),
              ),
              const SizedBox(width: Spacers.md),
              Expanded(
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isUpcoming ? Colors.white : DSColors.ctaTeal,
                      foregroundColor: isUpcoming ? DSColors.primaryText : Colors.white,
                       side: isUpcoming ? const BorderSide(color: DSColors.borders) : null,
                       elevation: 0,
                    ),
                    child: Text(isUpcoming ? "Cancel" : "Do It Again"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
