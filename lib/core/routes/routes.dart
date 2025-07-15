import 'package:cis_logistics_app/core/utils/app_constants.dart';
import 'package:cis_logistics_app/features/authentication/presentation/view/confirmation_code_view.dart';
import 'package:cis_logistics_app/features/authentication/presentation/view/forget_password_view.dart';
import 'package:cis_logistics_app/features/authentication/presentation/view/password_change_success_screen.dart';
import 'package:cis_logistics_app/features/authentication/presentation/view/reset_password_view.dart';
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

      case Routes.forgotPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordView());

      case Routes.confirmationCodeScreen:
        return MaterialPageRoute(builder: (_) => const ConfirmationCodeView());

      case Routes.resetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ResetPasswordView());

      case Routes.passwordChangeSuccessScreen:
        return MaterialPageRoute(
          builder: (_) => const PasswordChangeSuccessView(),
        );

      default:
        return null;
    }
  }
}
