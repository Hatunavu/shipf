import 'package:flutter/material.dart';
import 'package:shipf/ui/theme/constant.dart';

class AppThemes {
  static final appThemeData = {
    AppTheme.lightTheme: ThemeData(
      backgroundColor: Colors.white,
      primaryColor: primaryColor,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: contentColorLightTheme),
      fontFamily: "Montserrat",
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        error: errorColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: contentColorLightTheme.withOpacity(0.7),
        unselectedItemColor: contentColorLightTheme.withOpacity(0.32),
        selectedIconTheme: const IconThemeData(color: primaryColor),
        showUnselectedLabels: true,
      ),
    ),
    AppTheme.darkTheme: ThemeData(
      backgroundColor: darkGreyClr,
      primaryColor: primaryColor,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: contentColorLightTheme,
      iconTheme: const IconThemeData(color: contentColorDarkTheme),
      fontFamily: "Montserrat",
      colorScheme: const ColorScheme.dark().copyWith(
        primary: primaryColor,
        secondary: secondaryColor,
        error: errorColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: contentColorLightTheme,
        selectedItemColor: Colors.white70,
        unselectedItemColor: contentColorDarkTheme.withOpacity(0.32),
        selectedIconTheme: const IconThemeData(color: primaryColor),
        showUnselectedLabels: true,
      ),
    )
  };
}

enum AppTheme {
  lightTheme,
  darkTheme,
}
