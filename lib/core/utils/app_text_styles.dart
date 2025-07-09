import 'package:cis_logistics_app/core/utils/font_weights.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle regular16 = TextStyle(
    fontSize: 16,
    fontWeight: AppFontWeights.normal,
  );

  static const TextStyle medium16 = TextStyle(
    fontSize: 16,
    fontWeight: AppFontWeights.medium,
  );

  static const TextStyle medium18 = TextStyle(
    fontSize: 18,
    fontWeight: AppFontWeights.medium,
  );

  static const TextStyle medium20 = TextStyle(
    fontSize: 20,
    fontWeight: AppFontWeights.medium,
  );

  static const TextStyle semiBold18SFPro = TextStyle(
    fontSize: 18,
    fontWeight: AppFontWeights.semiBold,
    fontFamily: 'SF Pro Text',
  );

  static const TextStyle bold12 = TextStyle(
    fontSize: 12,
    fontWeight: AppFontWeights.bold,
  );

  static const TextStyle bold16 = TextStyle(
    fontSize: 16,
    fontWeight: AppFontWeights.bold,
  );

  static const TextStyle bold20Inter = TextStyle(
    fontSize: 20,
    fontWeight: AppFontWeights.bold,
    fontFamily: 'Inter',
  );

  static const TextStyle bold24 = TextStyle(
    fontSize: 24,
    fontWeight: AppFontWeights.bold,
  );
}
