import 'package:flutter/material.dart';
import 'package:microdeed/design_system/colors.dart';
import 'package:microdeed/design_system/spacers.dart';
import 'package:microdeed/design_system/styles.dart';

class InterestCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const InterestCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isSelected ? DSColors.tealMain : DSColors.borders,
            width: isSelected ? 2.0 : 1.0,
          ),
          borderRadius: BorderRadius.circular(Spacers.md),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: DSColors.tealMain.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        padding: const EdgeInsets.all(Spacers.md),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(Spacers.ssm),
              decoration: BoxDecoration(
                color: isSelected ? DSColors.tealLight : DSColors.tealLight.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: DSColors.tealMain,
                size: 32,
              ),
            ),
            const SizedBox(height: Spacers.md),
            Text(
              title,
              style: Styles.bodyRegular.copyWith(
                fontWeight: FontWeight.w700,
                color: DSColors.primaryText,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Spacers.xs),
            Text(
              subtitle,
              style: Styles.microSmall.copyWith(
                color: DSColors.secondaryText,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
