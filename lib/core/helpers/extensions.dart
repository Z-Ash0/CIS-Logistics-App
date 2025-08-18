import 'package:flutter/material.dart';

//* Screen
extension ScreenSizes on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;

  double setBasedOnScreenHeight(double value) => screenHeight * value;

  double setBasedOnScreenWidth(double value) => screenWidth * value;
}

//* Navigation
extension NavigationExtension on BuildContext {
  Future<T?> navigateTo<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.pushNamed<T>(this, routeName, arguments: arguments);
  }

  Future<T?> navigateAndRemoveUntil<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.pushNamedAndRemoveUntil<T>(
      this,
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  void pop<T extends Object?>([T? result]) {
    Navigator.pop<T>(this, result);
  }
}

//* String
extension StringExtension on String? {
  bool isNullOrEmpty() {
    return this == null || this!.isEmpty;
  }
}
