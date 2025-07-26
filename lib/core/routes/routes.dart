import 'package:cis_logistics_app/core/di/dependency_injection.dart';
import 'package:cis_logistics_app/core/utils/app_constants.dart';
import 'package:cis_logistics_app/features/authentication/presentation/manager/auth_cubit.dart';
import 'package:cis_logistics_app/features/authentication/presentation/view/confirmation_code_view.dart';
import 'package:cis_logistics_app/features/authentication/presentation/view/forget_password_view.dart';
import 'package:cis_logistics_app/features/authentication/presentation/view/password_change_success_screen.dart';
import 'package:cis_logistics_app/features/authentication/presentation/view/reset_password_view.dart';
import 'package:cis_logistics_app/features/authentication/presentation/view/sign_in_view.dart';
import 'package:cis_logistics_app/features/home/presentation/view/main_page_view.dart';
import 'package:cis_logistics_app/features/onboarding/presentation/views/on_boarding_screen.dart';
import 'package:cis_logistics_app/features/profile/presentation/view/change_password_view.dart';
import 'package:cis_logistics_app/features/profile/presentation/view/user_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  Route? getRoute(RouteSettings settings) {
    switch (settings.name) {
      //*OnBoarding Screen
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      //* Authentication Routes
      case Routes.signInScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: const SignInView(),
          ),
        );

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

      //* app main screens
      case Routes.mainPageScreen:
        return MaterialPageRoute(builder: (_) => const MainPageView());

      case Routes.userProfileScreen:
        return MaterialPageRoute(builder: (_) => const UserProfileView());
      case Routes.changePasswordScreen:
        return MaterialPageRoute(builder: (_) => const ChangePasswordView());
      default:
        return null;
    }
  }
}
