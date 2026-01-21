import 'package:flutter/material.dart';
import 'package:microdeed/design_system/spacers.dart';
import 'package:microdeed/design_system/styles.dart';

class InfoBadge extends StatelessWidget {
  const InfoBadge({
    super.key,
    required this.fillColor,
    required this.itemColor,
  });

  final Color itemColor;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      //padding: EdgeInsets.all(16),
      width: Spacers.x5l,
      height: Spacers.xl,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(Spacers.mmd),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check_circle_outline, color: itemColor, size: Spacers.sm),

          const SizedBox(width: Spacers.base),

          Text("On track", style: Styles.microSmall.copyWith(color: itemColor)),
        ],
      ),
    );
  }
}
