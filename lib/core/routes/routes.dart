import 'package:cis_logistics_app/core/utils/app_constants.dart';
import 'package:cis_logistics_app/features/authentication/presentation/view/login_view.dart';
import 'package:cis_logistics_app/features/onboarding/presentation/views/on_boarding_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  Route? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      case Routes.logInScreen:
        return MaterialPageRoute(builder: (_) => const LoginView());

      default:
        return null;
    }
  }
}
