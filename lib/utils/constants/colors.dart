import 'package:flutter/material.dart';

class HColors {
  HColors._();


  // App Basic Colors
  static const Color primaryColor = Color(0xFF4B68FF);
  // static const Color primaryColor = Color(0xFF0077b6);
  static const Color secondaryColor = Color(0xFFFFE24B);
  static const Color accentColor = Color(0xFFB0C7FF);
  static const Color verifiedIcon = Color(0xFF00A6FB);

  // Gradient Colors
  static const Gradient linearGradient = LinearGradient(
      begin: Alignment(0.0, 0.0),
      end: Alignment(0.707, -0.707),
      colors: [
        Color(0xFFFF9A9E),
        Color(0xFFFAD0C4),
        Color(0xFFFAD0C4),
  ]);

  // Text Colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textWhite = Colors.white;

  // Background Colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // Background Container Colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = HColors.textWhite.withOpacity(0.1);

  // Button Colors
  static const Color buttonPrimary = Color(0xFF4B68FF);
  static const Color buttonSecondary = Color(0xFF6C757D);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // Elevated Button -- Light Theme Colors
  static const Color lightElevatedButtonForeground = Colors.white;
  static const Color lightElevatedButtonBackground = Colors.blue;
  static const Color lightElevatedButtonDisabledBackground = Colors.grey;
  static const Color lightElevatedButtonDisabledForeground = Colors.grey;
  static const Color lightElevatedButtonBorder = Colors.blue;
  static const Color lightElevatedButtonText = Color(0xFFFFFFFF);

  // Elevated Button -- Dark Theme Colors
  static const Color darkElevatedButtonForeground = Colors.white;
  static const Color darkElevatedButtonBackground = Colors.blue;
  static const Color darkElevatedButtonDisabledBackground = Colors.grey;
  static const Color darkElevatedButtonDisabledForeground = Colors.grey;
  static const Color darkElevatedButtonBorder = Colors.blue;
  static const Color darkElevatedButtonText = Color(0xFFFFFFFF);

  // Outlined Button -- Light Theme Colors
  static const Color lightOutlinedButtonForeground = Colors.black;
  static const Color lightOutlinedButtonBorder = Colors.blue;
  static const Color lightOutlinedButtonText = Colors.black;

  // Outlined Button -- Dark Theme Colors
  static const Color darkOutlinedButtonForeground = Colors.white;
  static const Color darkOutlinedButtonBorder = Colors.blue;
  static const Color darkOutlinedButtonText = Colors.white;
  // Border Colors
  static const borderPrimary = Color(0xFFD9D9D9);
  static const borderSecondary = Color(0xFFE6E6E6);

  // Error and Validation Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
}