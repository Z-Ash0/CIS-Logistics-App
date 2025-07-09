import 'package:cis_logistics_app/core/utils/app_constants.dart';
import 'package:cis_logistics_app/features/authentication/presentation/view/sign_in_view.dart';
import 'package:cis_logistics_app/features/home/presentation/view/home_view.dart';
import 'package:cis_logistics_app/features/onboarding/presentation/views/on_boarding_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  Route? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      case Routes.signInScreen:
        return MaterialPageRoute(builder: (_) => const SignInView());

      case Routes.mainPageScreen:
        return MaterialPageRoute(builder: (_) => const HomeView());

      default:
        return null;
    }
  }
}
