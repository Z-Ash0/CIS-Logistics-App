//* Screens Routes
class Routes {
  //* onBoarding
  static const String onBoardingScreen = '/onBoardingScreen';

  //* Auth
  static const String signInScreen = '/signInScreen';
  static const String forgotPasswordScreen = '/forgetPasswordScreen';
  static const String resetPasswordScreen = '/resetPasswordScreen';
  static const String changePasswordScreen = '/changePasswordScreen';
  static const String confirmationCodeScreen = '/confirmationCodeScreen';
  static const String passwordChangeSuccessScreen =
      '/passwordChangeSuccessScreen';

  static const String signUpScreen = '/signUpScreen';
  static const String signUpVerificationScreen = '/signUpVerificationScreen';

  //*main app screens
  static const String mainPageScreen = '/mainPageScreen';
  static const String userProfileScreen = '/userProfileScreen';
}

class StorageServiceBoxNames {
  static const String isFirstTime = 'isFirstTimeBox';
  static const String isLoggedIn = 'isLoggedInBox';
  static const String userRole = 'userRoleBox';
  static const String themeMode = 'themeModeBox';
  static const String userData = 'userDataBox';
}

class StorageServiceKeys {
  static const String kIsFirstTime = 'isFirstTimeKey';
  static const String kIsLoggedIn = 'isLoggedInKey';
  static const String kUserRole = 'userRoleKey';
  static const String kThemeMode = 'themeModeKey';
  static const String kAccessToken = 'accessTokenKey';
  static const String kUserData = 'userDataKey';
}
