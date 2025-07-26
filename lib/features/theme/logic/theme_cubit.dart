import 'package:bloc/bloc.dart';
import 'package:cis_logistics_app/features/theme/data/theme_service.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(this._themeService) : super(ThemeMode.light) {
    loadTheme();
  }
  final ThemeService _themeService;

  Future<void> toggleTheme(ThemeMode themeMode) async {
    await _themeService.saveTheme(themeMode);
    emit(themeMode);
  }

  Future<void> loadTheme() async {
    final savedTheme = await _themeService.getSavedTheme();
    emit(savedTheme);
  }
}
