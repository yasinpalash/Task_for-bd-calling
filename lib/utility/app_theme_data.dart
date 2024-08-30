import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemeData {
  static ThemeData lightThemeData = ThemeData(
    primaryColor: AppColors.primaryColor,
    appBarTheme: const AppBarTheme(
      foregroundColor: AppColors.whiteColor,
      titleTextStyle: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
      backgroundColor: AppColors.primaryColor,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        backgroundColor: Colors.teal,
        elevation: 5.0,
      ),
    ),
  );
}
