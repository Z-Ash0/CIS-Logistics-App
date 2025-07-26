import 'package:cis_logistics_app/core/di/dependency_injection.dart';
import 'package:cis_logistics_app/core/helpers/local_storage_extention.dart';
import 'package:cis_logistics_app/core/services/hive_service.dart';
import 'package:flutter/material.dart';

class ThemeService {
  Future<ThemeMode> getSavedTheme() async {
    final String theme = getIt<HiveService>().themeMode;
    return ThemeMode.values.byName(theme);
  }

  Future<void> saveTheme(ThemeMode theme) async {
    getIt<HiveService>().setThemeModeValue(theme.name);
  }
}
