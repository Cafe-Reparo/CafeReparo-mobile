import 'package:cafe_reparo_mobile/themes/colors.dart';
import 'package:flutter/material.dart';

class CustomThemes {
  static const textStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
  );

  final defaultTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white70,
    primaryColor: MyColors.white25,
    primaryTextTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 96,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      labelLarge: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      labelSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        letterSpacing: 1.0,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: MyColors.primary550,
      labelStyle: const TextStyle(
        color: MyColors.primary550,
      ),
      hintStyle: const TextStyle(
        color: MyColors.primary550,
      ),
      suffixIconColor: MyColors.primary550,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: MyColors.primary550),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: MyColors.primary550, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: MyColors.primary550),
      ),
    ),
  );
}
