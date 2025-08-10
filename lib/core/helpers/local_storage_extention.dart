import 'package:cis_logistics_app/core/enums/user_role.dart';
import 'package:cis_logistics_app/core/services/storage_service.dart';
import 'package:cis_logistics_app/core/utils/app_constants.dart';
import 'package:flutter/material.dart';

//* isFirstTime extension
extension IsFirstTimeLocalStorage on StorageService {
  bool get isFirstTime =>
      isFirstTimeBox.get(StorageServiceKeys.kIsFirstTime, defaultValue: true)
          as bool;

  Future<void> setIsFirstTimeValue(bool value) async {
    await isFirstTimeBox.put(StorageServiceKeys.kIsFirstTime, value);
  }
}

//* isLoggedIn extension
extension IsLoggedInLocalStorage on StorageService {
  bool get isLoggedIn =>
      isLoggedInBox.get(StorageServiceKeys.kIsLoggedIn, defaultValue: false)
          as bool;

  Future<void> setIsloggedInValue(bool value) async {
    await isLoggedInBox.put(StorageServiceKeys.kIsLoggedIn, value);
  }
}

//* UserRole extension
extension UserRoleLocalStorage on StorageService {
  UserRole? get userRole {
    final endpoint = userRoleBox.get(StorageServiceKeys.kUserRole);
    if (endpoint == null) return null;
    return UserRole.values.firstWhere((e) => e.endpoint == endpoint);
  }

  Future<void> setUserRoleValue(UserRole? value) async {
    await userRoleBox.put(StorageServiceKeys.kUserRole, value);
  }
}

//* ThemeMode extension
extension ThemeModeLocalStorage on StorageService {
  String? get themeMode => themeModeBox.get(
    StorageServiceKeys.kThemeMode,
    defaultValue: ThemeMode.system.name,
  );

  Future<void> setThemeModeValue(String? value) async {
    await themeModeBox.put(StorageServiceKeys.kThemeMode, value);
  }
}
