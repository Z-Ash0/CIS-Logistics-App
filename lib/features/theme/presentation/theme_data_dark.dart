import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData getDarkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkerGreen,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.white,
      brightness: Brightness.dark,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkerGreen,
      elevation: 0,
    ),

    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all(AppColors.white), // White ✓
      fillColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.lightGreen;
        }
        return AppColors.lightCyan;
      }),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      side: const BorderSide(color: AppColors.lightGreen, width: 2),
    ),

    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.lightGreen;
        }
        return AppColors.white;
      }),
    ),
  );
}
