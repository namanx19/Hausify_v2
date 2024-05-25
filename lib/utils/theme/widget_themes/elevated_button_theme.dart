import 'package:flutter/material.dart';

import '../../constants/colors.dart';

/// -- Light and Dark Elevated Button Themes

class HElevatedButtonTheme {
  HElevatedButtonTheme._(); //To avoid creating instances


  // Light Theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: HColors.lightElevatedButtonForeground,
      backgroundColor: HColors.lightElevatedButtonBackground,
      disabledForegroundColor: HColors.lightElevatedButtonDisabledForeground,
      disabledBackgroundColor: HColors.lightElevatedButtonDisabledBackground,
      side: const BorderSide(color: HColors.lightElevatedButtonBorder),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(fontSize: 16, color: HColors.lightElevatedButtonText, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    )
  );


  // Dark Theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: HColors.darkElevatedButtonForeground,
        backgroundColor: HColors.darkElevatedButtonBackground,
        disabledForegroundColor: HColors.darkElevatedButtonDisabledForeground,
        disabledBackgroundColor: HColors.darkElevatedButtonDisabledBackground,
        side: const BorderSide(color: HColors.darkElevatedButtonBorder),
        padding: const EdgeInsets.symmetric(vertical: 18),
        textStyle: const TextStyle(fontSize: 16, color: HColors.lightElevatedButtonText, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      )
  );
}