import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData getLightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.black,
      brightness: Brightness.light,
    ),

    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all(AppColors.white), // White ✓
      fillColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.lightGreen;
        }
        return AppColors.white;
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
        return AppColors.lightBlack;
      }),
    ),
  );
}
