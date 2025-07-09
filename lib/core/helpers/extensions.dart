import 'package:flutter/material.dart';

//* Screen
extension ScreenSizes on BuildContext {
  get screenHeight => MediaQuery.of(this).size.height;
  get screenWidth => MediaQuery.of(this).size.width;

  double setBasedOnScreenHeight(double value) => screenHeight * value;

  double setBasedOnScreenWidth(double value) => screenWidth * value;
}

//* Navigation
extension NavigationExtension on BuildContext {
  void navigateTo(String routeName) {
    Navigator.pushNamed(this, routeName);
  }

  void navigateAndRemoveUntil(String routeName) {
    Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false);
  }

  void pop() {
    Navigator.pop(this);
  }
}
