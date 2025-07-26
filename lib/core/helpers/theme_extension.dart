import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

extension ThemeContext on BuildContext {
  bool get isDark {
    return Theme.of(this).brightness == Brightness.dark;
  }

  bool get isLight {
    return Theme.of(this).brightness == Brightness.light;
  }

  CustomColors get customColors {
    return Theme.of(this).customColors;
  }
}

extension CustomColorsExtension on ThemeData {
  CustomColors get customColors {
    if (brightness == Brightness.dark) return CustomColors._dark();
    return CustomColors._light();
  }
}

class CustomColors {
  const CustomColors._({
    required this.requiredTextColor,
    required this.textFieldInputColor,
    required this.radioButtonUnselectedTextColor,
    required this.textFieldBackgroundColor,
  });
  final Color requiredTextColor;
  final Color textFieldInputColor;
  final Color radioButtonUnselectedTextColor;
  final Color textFieldBackgroundColor;

  factory CustomColors._light() {
    return const CustomColors._(
      requiredTextColor: AppColors.darkGreen,
      textFieldInputColor: AppColors.darkGreen,
      radioButtonUnselectedTextColor: AppColors.lightBlack,
      textFieldBackgroundColor: Colors.transparent,
    );
  }

  factory CustomColors._dark() {
    return const CustomColors._(
      requiredTextColor: AppColors.white,
      textFieldInputColor: AppColors.lightGreen,
      radioButtonUnselectedTextColor: AppColors.white,
      textFieldBackgroundColor: AppColors.lightCyan,
    );
  }
}
