import 'package:flutter/material.dart';
import 'dart:ui' show FontFeature;
import 'package:google_fonts/google_fonts.dart';
import 'package:microdeed/design_system/spacers.dart';
import 'colors.dart';

class Styles {
  const Styles._();

  // Base font family
  static final TextStyle base = GoogleFonts.poppins(color: DSColors.primaryText);

  // Display Bold
  static final TextStyle displayBold = base.copyWith(fontWeight: FontWeight.w800, fontSize: 48, height: 1.1);

  // Heading General
  static final TextStyle headingGeneral = base.copyWith(fontWeight: FontWeight.w700, fontSize: 24, height: 1.3);

  // Subheading Strong
  static final TextStyle subheadingStrong = base.copyWith(fontWeight: FontWeight.w600, fontSize: 18, height: 1.4);

  // Body Regular
  static final TextStyle bodyRegular = base.copyWith(fontWeight: FontWeight.w400, fontSize: 16, height: 1.6);

  // Caption Medium
  static final TextStyle captionMedium = base.copyWith(fontWeight: FontWeight.w500, fontSize: 14, height: 1.5);

  // Micro Small
  static final TextStyle microSmall = base.copyWith(fontWeight: FontWeight.w400, fontSize: 12, height: 1.4);

  // Timer Display (use tabular figures so digits keep fixed width)
  static final TextStyle timerDisplay = base.copyWith(
    fontWeight: FontWeight.w900,
    fontSize: Spacers.x3l,
    height: 1.0,
  );

  // 10 MIN Badge
  static final TextStyle badge10Min = base.copyWith(fontWeight: FontWeight.w800, fontSize: 16, letterSpacing: 0.5, textBaseline: TextBaseline.alphabetic);
}