import 'package:flutter/material.dart';

class Spacers {
  const Spacers._();

  static const double base = 4.0; // Base unit

  static const double xs = base *  1;  // 4px
  static const double ssm = base * 2;  // 8px
  static const double sm = base *  3;  // 12px
  static const double md = base *  4;  // 16px
  static const double mmd = base * 5;  // 20px
  static const double lg = base *  6;  // 24px
  static const double xl = base *  8;  // 32px
  static const double x2l = base * 12; // 48px
  static const double x3l = base * 16; // 64px
  static const double x4l = base * 18; // 72px
  static const double x5l = base * 24; // 96px

  // Responsive helpers (percentage of screen)
  static double responsiveWidth(BuildContext context, double fraction) {
    return MediaQuery.of(context).size.width * fraction;
  }

  static double responsiveHeight(BuildContext context, double fraction) {
    return MediaQuery.of(context).size.height * fraction;
  }
}