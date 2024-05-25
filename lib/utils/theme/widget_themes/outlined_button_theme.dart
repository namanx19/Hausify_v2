import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class HOutlinedButtonTheme {
  HOutlinedButtonTheme._();

  // Light Theme
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: HColors.lightOutlinedButtonForeground,
      side: const BorderSide(color: HColors.lightOutlinedButtonBorder),
      textStyle: const TextStyle(fontSize: 16, color: HColors.lightOutlinedButtonText, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))
    )
  );


  // Dark Theme
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          elevation: 0,
          foregroundColor: HColors.darkOutlinedButtonForeground,
          side: const BorderSide(color: HColors.darkOutlinedButtonBorder),
          textStyle: const TextStyle(fontSize: 16, color: HColors.darkOutlinedButtonText, fontWeight: FontWeight.w600),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))
      )
  );
}