import 'package:flutter/material.dart';
import 'custom_themes/text_theme.dart';

import 'custom_themes/appbar_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_field_theme.dart';
import 'custom_themes/text_theme.dart';



class HAppTheme {
  HAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: HTextTheme.lightTextTheme,
    chipTheme: HChipTheme.lightChipTheme,
    appBarTheme: HAppBarTheme.lightAppBarTheme,
    checkboxTheme: HCheckBoxTheme.lightCheckBoxTheme,
    bottomSheetTheme: HBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: HElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: HOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: HTextFormFieldTheme.lightInputDecorationTheme,

  );
  //More types of themes for different catgories can be applied in the similar way
  //Press CTRL + Space to see the list of available options

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: HTextTheme.darkTextTheme,
      chipTheme: HChipTheme.darkChipTheme,
      appBarTheme: HAppBarTheme.darkAppBarTheme,
      checkboxTheme: HCheckBoxTheme.darkCheckBoxTheme,
      bottomSheetTheme: HBottomSheetTheme.darkBottomSheetTheme,
      elevatedButtonTheme: HElevatedButtonTheme.darkElevatedButtonTheme,
      outlinedButtonTheme: HOutlinedButtonTheme.darkOutlinedButtonTheme,
      inputDecorationTheme: HTextFormFieldTheme.darkInputDecorationTheme
  );
}