import 'package:flutter/material.dart';

class Spacers {
  const Spacers._();

  static const double base = 4.0; // Base unit

  static const double xs = base * 1;  // 4px
  static const double sm = base * 2;  // 8px
  static const double md = base * 4;  // 16px
  static const double lg = base * 6;  // 24px
  static const double xl = base * 8;  // 32px
  static const double x2l = base * 12; // 48px

  // Responsive helpers (percentage of screen)
  static double responsiveWidth(BuildContext context, double fraction) {
    return MediaQuery.of(context).size.width * fraction;
  }

  static double responsiveHeight(BuildContext context, double fraction) {
    return MediaQuery.of(context).size.height * fraction;
  }
}