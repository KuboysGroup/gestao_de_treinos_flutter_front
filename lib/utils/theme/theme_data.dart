import 'package:flutter/material.dart';

class ARCTheme {
  ARCTheme._();

  static ThemeData lightTheme = ThemeData(
    scrollbarTheme: ScrollbarThemeData(
        thumbVisibility: WidgetStateProperty.all<bool>(true),
        thickness: WidgetStateProperty.all<double>(15.0)),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: Colors.grey.withOpacity(0.15),
        disabledBackgroundColor: Colors.grey.withOpacity(0.15),
      ),
    ),
    fontFamily: 'dmSans',
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme(
      background: Colors.white,
      brightness: Brightness.light,
      primary: lightAccentColor,
      onPrimary: Colors.white,
      secondary: lightSecondaryColor,
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.red,
      onBackground: primaryAltButtonColor,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
  );

  static ThemeData darkTheme = ThemeData();
}

const lightTextColor = Color(0xFF040316);
const lightBackgroundColor = Color(0xfff5f5f5);
const lightAccentColor = Color(0xFF4B5D4D);
const lightSecondaryColor = Color(0xFFBDD0BE);
const lightBorderColor = Colors.white12;

const black = Colors.black;
const black12 = Color(0x1F000000);
const altBlack = Colors.black54;
const backgroundColor = Color(0xfff5f5f5);
const altBackgroundColor = Colors.white;
const secondaryColor = Color(0xFFB5BBA4);
const primaryButtonColor = Color(0xFF2C4001);
const primaryAltButtonColor = Color(0xFFFFFFFF);
const shortcutButtonColor = Color(0xFFFFFFFF);
