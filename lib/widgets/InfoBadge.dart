import 'package:flutter/material.dart';
import 'package:microdeed/design_system/colors.dart';
import 'package:microdeed/design_system/spacers.dart';
import 'package:microdeed/design_system/styles.dart';

class InfoBadge extends StatelessWidget {
  const InfoBadge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.check_circle_outline,
          color: DSColors.tealMain,
          size: Spacers.sm,
        ),
    
        const SizedBox(width: Spacers.base),
    
        Text(
          "On track",
          style: Styles.microSmall.copyWith(
            color: DSColors.tealMain,
          ),
        ),
      ],
    );
  }
}
