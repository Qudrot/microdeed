import 'package:flutter/material.dart';
import 'package:microdeed/design_system/colors.dart';
import 'package:microdeed/design_system/spacers.dart';
import 'package:microdeed/design_system/styles.dart';

class OpportunityCard extends StatelessWidget {
  const OpportunityCard({
    super.key,
    required this.duration,
    required this.distance,
    required this.title,
    required this.description,
    required this.avgCompletionTime,
    required this.location,
    required this.dateTime,
  });

  final String duration;
  final String distance;
  final String title;
  final String description;
  final String avgCompletionTime;
  final String location;
  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Spacers.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // 10 MIN Badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacers.sm,
                    vertical: Spacers.base,
                  ),
                  decoration: BoxDecoration(
                    color: DSColors.ctaTeal,
                    borderRadius: BorderRadius.circular(Spacers.ssm),
                  ),
                  child: Text(
                    duration,
                    style: Styles.badge10Min.copyWith(
                      color: DSColors.surface,
                    ),
                  ),
                ),
                const SizedBox(width: Spacers.sm),
                // Distance arrow
                const Icon(
                  Icons.near_me,
                  size: Spacers.md,
                  color: DSColors.secondaryText,
                ),
                const SizedBox(width: Spacers.base),
                Text(
                  distance,
                  style: Styles.microSmall.copyWith(
                    color: DSColors.secondaryText,
                  ),
                ),
              ],
            ),
            const SizedBox(height: Spacers.md),
            // Title
            Text(
              title,
              style: Styles.subheadingStrong.copyWith(
                color: DSColors.primaryText,
              ),
            ),
            const SizedBox(height: Spacers.ssm),
            // Description
            Text(
              description,
              style: Styles.bodyRegular.copyWith(
                color: DSColors.primaryText,
              ),
            ),
            const SizedBox(height: Spacers.md),
            // Average Completion Badge
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacers.md,
                vertical: Spacers.ssm,
              ),
              decoration: BoxDecoration(
                color: DSColors.tealLight,
                borderRadius: BorderRadius.circular(Spacers.md),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.access_time_filled,
                    size: Spacers.md,
                    color: DSColors.success,
                  ),
                  const SizedBox(width: Spacers.sm),
                  Text(
                    "Average Completion: $avgCompletionTime",
                    style: Styles.captionMedium.copyWith(
                      color: DSColors.success,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: Spacers.md),
            // Footer: Location & Date
            Row(
              children: [
                const Icon(
                  Icons.location_on, // Or appropriate icon
                  size: Spacers.md,
                  color: DSColors.secondaryText,
                ),
                const SizedBox(width: Spacers.base),
                Text(
                  location,
                  style: Styles.microSmall.copyWith(
                    color: DSColors.secondaryText,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: Spacers.sm),
                  child: Text("•", style: TextStyle(color: DSColors.secondaryText)),
                ),
                const Icon(
                  Icons.calendar_today,
                  size: Spacers.md,
                  color: DSColors.secondaryText,
                ),
                const SizedBox(width: Spacers.base),
                Text(
                  dateTime,
                  style: Styles.microSmall.copyWith(
                    color: DSColors.secondaryText,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
