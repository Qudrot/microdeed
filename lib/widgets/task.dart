import 'package:flutter/material.dart';
import 'package:microdeed/design_system/colors.dart';
import 'package:microdeed/design_system/spacers.dart';
import 'package:microdeed/design_system/styles.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.isActive, required this.isDone});

  final bool isActive;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(Spacers.ssm),
      padding: const EdgeInsets.all(Spacers.ssm),
      decoration: BoxDecoration(
        border: isActive
            ? Border.all(color: DSColors.tealMain, width: 1)
            : Border(bottom: BorderSide.none),
        borderRadius: BorderRadius.circular(Spacers.ssm),
      ),
      child: Row(
        spacing: Spacers.sm,
        children: [
          // check if a task is complete
          Container(
                  alignment: Alignment.center,
                  width: Spacers.xl,
                  height: Spacers.xl,
                  decoration: BoxDecoration(
                    color: DSColors.inactive,
                    shape: BoxShape.circle,
                  ),
                  child: isDone? Text("assets/check.png") : Text(
                    "2",
                    style: Styles.captionMedium.copyWith(
                      color: DSColors.surface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ,

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: Spacers.base,
            children: [
              Text(
                "Sort books by age group",
                style: Styles.captionMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "0-5 years, 6-12 years, Teen",
                style: Styles.microSmall.copyWith(fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
