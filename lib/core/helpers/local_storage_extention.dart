import 'package:cis_logistics_app/core/services/hive_service.dart';
import 'package:cis_logistics_app/core/utils/app_constants.dart';
import 'package:flutter/material.dart';

//* isFirstTime extension
extension IsFirstTimeLocalStorage on HiveService {
  bool get isFirstTime =>
      isFirstTimeBox.get(HiveKeys.kIsFirstTime, defaultValue: true) as bool;

  Future<void> setIsFirstTimeValue(bool value) async {
    await isFirstTimeBox.put(HiveKeys.kIsFirstTime, value);
  }
}

//* isLoggedIn extension
extension IsLoggedInLocalStorage on HiveService {
  bool get isLoggedIn =>
      isLoggedInBox.get(HiveKeys.kIsLoggedIn, defaultValue: false) as bool;

  Future<void> setIsloggedInValue(bool value) async {
    await isLoggedInBox.put(HiveKeys.kIsLoggedIn, value);
  }
}

//* UserRole extension
extension UserRoleLocalStorage on HiveService {
  String? get userRole =>
      userRoleBox.get(HiveKeys.kUserRole, defaultValue: null) as String?;

  Future<void> setUserRoleValue(String? value) async {
    await userRoleBox.put(HiveKeys.kUserRole, value);
  }
}

//* ThemeMode extension
extension ThemeModeLocalStorage on HiveService {
  String get themeMode => themeModeBox.get(
    HiveKeys.kThemeMode,
    defaultValue: ThemeMode.system.name,
  );

  Future<void> setThemeModeValue(String? value) async {
    await themeModeBox.put(HiveKeys.kThemeMode, value);
  }
}
