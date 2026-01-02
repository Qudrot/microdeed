import 'package:flutter/material.dart';
import 'package:microdeed/design_system/colors.dart';
import 'package:microdeed/design_system/spacers.dart';
import 'package:microdeed/design_system/styles.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.isDone,
    required this.isActive,
    required this.taskNumber,
  });

  final bool isActive;
  final bool isDone;
  final String taskNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(Spacers.ssm),
      padding: const EdgeInsets.all(Spacers.ssm),
      decoration: BoxDecoration(
        border: isActive
            ? Border.all(color: DSColors.tealMain, width: 2)
            : null,
        borderRadius: BorderRadius.circular(Spacers.ssm),
        color: isActive ? DSColors.tealLight : Colors.transparent,
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
              color: isDone
                  ? DSColors.inactive
                  : isActive
                  ? DSColors.tealMain
                  : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: (() {
              if (isActive) {
                return Text(
                  taskNumber,
                  style: Styles.captionMedium.copyWith(
                    color: DSColors.surface,
                    fontWeight: FontWeight.w900,
                  ),
                );
              } else if (isDone) {
                return Icon(
                  Icons.check,
                  color: DSColors.tealMain,
                  size: Spacers.md,
                );
              } else {
                return Text(
                  taskNumber,
                  style: Styles.captionMedium.copyWith(
                    color: DSColors.secondaryText.withOpacity(0.3),
                    fontWeight: FontWeight.w900,
                  ),
                );
              }
            }()),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: Spacers.base,
            children: [
              Text(
                "Sort books by age group",
                style: Styles.captionMedium.copyWith(
                  color: !isActive? DSColors.secondaryText.withOpacity(0.9) : null,
                  fontWeight: FontWeight.w600,
                  decoration: isDone ? TextDecoration.lineThrough : null,
                ),
              ),
              Text(
                "0-5 years, 6-12 years, Teen",
                style: Styles.microSmall.copyWith(
                  fontWeight: FontWeight.w200,
                  color: !isActive? DSColors.secondaryText.withOpacity(0.3) : null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
