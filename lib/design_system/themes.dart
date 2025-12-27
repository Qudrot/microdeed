import 'package:flutter/material.dart';
import 'colors.dart';
import 'styles.dart';
import 'spacers.dart';
import 'shadows.dart';
import 'borders.dart';

ThemeData dsTheme() {
  return ThemeData(
    useMaterial3: false, // For classic control like your PDF

    scaffoldBackgroundColor: DSColors.background,

    // ColorScheme
    colorScheme: ColorScheme.light(
      primary: DSColors.ctaTeal,
      secondary: DSColors.tealMain,
      surface: DSColors.surface,
      error: DSColors.critical,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: DSColors.primaryText,
    ),

    // Typography
    textTheme: TextTheme(
      displayLarge: Styles.displayBold,
      headlineLarge: Styles.headingGeneral,
      headlineMedium: Styles.subheadingStrong,
      bodyLarge: Styles.bodyRegular,
      labelMedium: Styles.captionMedium,
      labelSmall: Styles.microSmall,
    ),

    // Buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(64),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Spacers.xl)),
        backgroundColor: DSColors.ctaTeal,
        foregroundColor: Colors.white,
        textStyle: Styles.bodyRegular.copyWith(fontWeight: FontWeight.w600, fontSize: Spacers.mmd),
        padding: EdgeInsets.symmetric(horizontal: Spacers.lg),
        elevation: DSShadows.card[0].blurRadius,
        shadowColor: DSShadows.card[0].color,
      ),
    ),

    // Cards
    cardTheme: CardThemeData(
      color: DSColors.surface,
      elevation: DSShadows.card[0].blurRadius,
      shadowColor: DSShadows.card[0].color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Spacers.sm),
        side: DSBorders.card,
      ),
      margin: EdgeInsets.only(bottom: Spacers.md),
    ),

    // AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: DSColors.surface,
      foregroundColor: DSColors.primaryText,
      elevation: DSShadows.card[0].blurRadius,
      centerTitle: true,
      titleTextStyle: Styles.headingGeneral,
    ),

    // BottomNavigationBar
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: DSColors.surface,
      selectedItemColor: DSColors.ctaTeal,
      unselectedItemColor: DSColors.secondaryText,
      selectedLabelStyle: Styles.microSmall.copyWith(fontWeight: FontWeight.w600),
      unselectedLabelStyle: Styles.microSmall.copyWith(fontWeight: FontWeight.w400),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      elevation: DSShadows.elevated[0].blurRadius,
    ),
  );
}