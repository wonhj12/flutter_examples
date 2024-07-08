import 'package:flutter/material.dart';

class LightPalette {
  static const Color primary = Color(0xffD0BCFF);
  static const Color onPrimary = Color(0xff381E72);
  static const Color primaryContainer = Color(0xff4F378B);
  static const Color onPrimaryContainer = Color(0xffEADDFF);
}

class DarkPalette {
  static const Color primary = Color(0xff6750A4);
  static const Color onPrimary = Colors.white;
  static const Color primaryContainer = Color(0xffEADDFF);
  static const Color onPrimaryContainer = Color(0xff21005D);
}

class CustomColorScheme {
  static const ColorScheme lightScheme = ColorScheme.light(
    primary: LightPalette.primary,
    onPrimary: LightPalette.onPrimary,
    primaryContainer: LightPalette.primaryContainer,
    onPrimaryContainer: LightPalette.onPrimaryContainer,
  );

  static const ColorScheme darkScheme = ColorScheme.light(
    primary: DarkPalette.primary,
    onPrimary: DarkPalette.onPrimary,
    primaryContainer: DarkPalette.primaryContainer,
    onPrimaryContainer: DarkPalette.onPrimaryContainer,
  );
}

class CustomThemeData {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: LightPalette.primary,
      titleTextStyle: TextStyle(fontSize: 18, color: LightPalette.onPrimary),
      iconTheme: IconThemeData(color: LightPalette.onPrimary),
    ),
    scaffoldBackgroundColor: LightPalette.primary,
    colorScheme: CustomColorScheme.lightScheme,
  );

  static ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: DarkPalette.primary,
      titleTextStyle: TextStyle(fontSize: 18, color: DarkPalette.onPrimary),
      iconTheme: IconThemeData(color: DarkPalette.onPrimary),
    ),
    scaffoldBackgroundColor: DarkPalette.primary,
    colorScheme: CustomColorScheme.darkScheme,
  );
}
