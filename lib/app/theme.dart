import 'package:flutter/material.dart';

class AppTheme {
  // Pandamonium Color Palette - Black, white, greyscale
  static const Color black = Color(0xFF000000);
  static const Color ink = Color(0xFF111111);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey100 = Color(0xFFF6F6F6);
  static const Color grey200 = Color(0xFFE7E7E7);
  static const Color grey400 = Color(0xFF767676);

  // Theme aliases
  static const Color primary = ink;
  static const Color secondary = black;
  static const Color background = white;
  static const Color surface = white;
  static const Color border = black;
  static const Color text = ink;
  static const Color textSecondary = grey400;
  static const Color textTertiary = grey400;

  // Typography - Clean, strong hierarchy
  static const TextStyle headingXL = TextStyle(
    fontSize: 56,
    fontWeight: FontWeight.w900,
    height: 1.08,
    color: ink,
    letterSpacing: -0.055,
  );

  static const TextStyle headingLg = TextStyle(
    fontSize: 44,
    fontWeight: FontWeight.w900,
    height: 1.08,
    color: ink,
    letterSpacing: -0.04,
  );

  static const TextStyle headingMd = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w900,
    height: 1.08,
    color: ink,
    letterSpacing: -0.04,
  );

  static const TextStyle headingSm = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    height: 1.2,
    color: ink,
  );

  static const TextStyle headingXs = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    height: 1.3,
    color: ink,
  );

  static const TextStyle bodyLg = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 1.65,
    color: ink,
  );

  static const TextStyle bodyMd = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.65,
    color: ink,
  );

  static const TextStyle bodySm = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.65,
    color: ink,
  );

  static const TextStyle bodyXs = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    height: 1.4,
    color: grey400,
  );

  static const TextStyle label = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w800,
    height: 1.2,
    color: black,
    letterSpacing: 0.12,
  );

  // Spacing - Generous and clean
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
  static const double gutter = 20; // Base gutter

  // Border radius - Pandamonium style
  static const double radiusSm = 4;
  static const double radiusMd = 8;
  static const double radiusLg = 12;
  static const double radiusXl = 16;

  // Get theme data
  static ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: black,
      scaffoldBackgroundColor: white,
      fontFamily: 'Inter',
      appBarTheme: const AppBarTheme(
        backgroundColor: white,
        elevation: 0,
        centerTitle: false,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: black),
        titleTextStyle: headingMd,
        surfaceTintColor: white,
      ),
      textTheme: const TextTheme(
        displayLarge: headingXL,
        displayMedium: headingLg,
        displaySmall: headingMd,
        headlineMedium: headingSm,
        headlineSmall: headingXs,
        titleLarge: bodyLg,
        titleMedium: bodyMd,
        bodyLarge: bodyLg,
        bodyMedium: bodyMd,
        bodySmall: bodySm,
        labelSmall: bodyXs,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: md,
          vertical: md,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusLg),
          borderSide: const BorderSide(color: black, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusLg),
          borderSide: const BorderSide(color: black, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusLg),
          borderSide: const BorderSide(color: black, width: 2),
        ),
        hintStyle: bodyMd.copyWith(color: grey400),
        labelStyle: bodyMd.copyWith(color: black),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: black,
          foregroundColor: white,
          padding: const EdgeInsets.symmetric(
            horizontal: lg,
            vertical: md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusLg),
            side: const BorderSide(color: black, width: 2),
          ),
          textStyle: headingXs.copyWith(color: white),
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: black,
          padding: const EdgeInsets.symmetric(
            horizontal: lg,
            vertical: md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusLg),
            side: const BorderSide(color: black, width: 2),
          ),
          side: const BorderSide(color: black, width: 2),
          textStyle: headingXs.copyWith(color: black),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: black,
          padding: const EdgeInsets.symmetric(
            horizontal: md,
            vertical: sm,
          ),
          textStyle: bodyMd.copyWith(
            color: black,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: white,
        elevation: 0,
        surfaceTintColor: white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusLg),
          side: const BorderSide(color: black, width: 1),
        ),
        margin: EdgeInsets.zero,
      ),
      dividerTheme: const DividerThemeData(
        color: black,
        thickness: 1,
        space: lg,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: grey100,
        selectedColor: black,
        labelStyle: bodySm.copyWith(color: black),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusLg),
          side: const BorderSide(color: black, width: 2),
        ),
        side: const BorderSide(color: black, width: 2),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: white,
        selectedItemColor: black,
        unselectedItemColor: grey400,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
      ),
    );
  }
}
