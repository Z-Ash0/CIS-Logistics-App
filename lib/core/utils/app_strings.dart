class AppStrings {
  AppStrings._();

  // UI Labels
  static const String appName = 'CIS Logistikawy';
  static const String appDescription =
      'On the day of the event, we\'ll scan the QR code that was sent to attendees by email to confirm their attendance';
  static const String welcome = 'Welcome';
  static const String rememberMeLabel = 'Remember me';
  static const String forgetPasswordQuestion = 'Forget Password?';

  // Buttons
  static const String send = 'Send';
  static const String verify = 'Verify';
  static const String continueTxt = 'Continue';
  static const String cancel = 'Cancel';
  static const String next = 'Next';
  static const String skip = 'Skip';
  static const String changePassword = 'Change Password';
  static const String updatePassword = 'Update Password';

  // Auth
  static const String signIn = 'Sign In';
  static const String logIn = 'Log In';

  static const String role = 'Role';
  static const String emailAddress = 'Email Address';
  static const String password = 'Password';
  static const String resetPassword = 'Reset Password';
  static const String confirmPassword = 'Confirm Password';

  static const String createNewPassword = 'Create New Password';
  static const String confirmNewPassword = 'Confirm New Password';
  static const String forgetPassword = 'Forget Password?';
  static const String newPasswordRules =
      'Your new password must be 8 characters\nincluding Lowercase and Uppercase letter,\nnumbers and special symbol.';

  static const String passwordChangeSuccessfully =
      'Password Change\nsuccessfully !';
  static const String passwordUpdatedSuccessfully =
      'Password updated successfully';
  static const String pleaseLogin =
      'Your Password has been changed\nsuccessfully ! please log in with new\npassword.';
  static const String loginSuccess = 'Welcome back! We missed you';

  static const String confirmationCode = 'Confirmation Code';
  static const String checkYourEmail = 'Check Your Email';
  static const String rememberMe = 'Remember Me';

  // QR code page
  static const String qrCodeScanner = 'QR Code Scanner';
  static const String alreadyCheckedIn = 'Already Checked In!';
  static const String attendanceWasPreviouslyRecorded =
      'Attendance was previously recorded.';
  static const String scanAnother = 'Scan Another';
  static const String successfulQrScanning =
      'The QR has been scanned successfully. The attendee is now marked as present.';
  static const String attendanceConfirmed = 'Attendance Confirmed';
  static const String instructions = 'Instructions';

  // User Profile
  static const String fullName = 'Full Name';
  static const String newPassword = 'New Password';
  static const String currentPassword = 'Current Password';
  static const String logout = 'Logout';
  static const String logOut = 'Log Out';
  static const String logoutConfirmTitle = 'Logout';
  static const String logoutConfirmMessage = 'Are you sure you want to logout?';

  // Bottom Navigation Bar
  static const String home = 'Home';
  static const String qrScanner = 'QR Scanner';
  static const String notifications = 'Notifications';
  static const String qrScannerScreen = 'QR Scanner Screen';
  static const String noNewNotifications = 'No new notifications';

  // Validation Messages
  static const String enterEmailAddress = 'Please enter your email address';
  static const String enterValidEmail = 'Please enter a valid email address';
  static const String enterPassword = 'Please enter your password';
  static const String invalidPassword = 'Invalid password';
  static const String enterDigit = 'Please enter a digit';
  static const String pleaseEnterAllDigits = 'Please enter all 6 digits';

  // Password Validation Messages
  static const String passwordTooShort =
      'Password must be at least 8 characters';
  static const String passwordTooLong =
      'Password must be less than 50 characters';
  static const String passwordMissingUppercase =
      'Password must contain at least one uppercase letter';
  static const String passwordMissingLowercase =
      'Password must contain at least one lowercase letter';
  static const String passwordMissingNumber =
      'Password must contain at least one number';
  static const String passwordMissingSpecialChar =
      'Password must contain at least one special character';
  static const String passwordsDoNotMatch = 'Passwords do not match';
  static const String enterConfirmPassword = 'Please confirm your password';
  static const String weakPassword = 'Password is too weak';
  static const String strongPassword = 'Strong password';
  static const String mediumPassword = 'Medium strength password';

  // Errors
  static const String networkError = 'Network Error. Please try again.';
  static const String serverError = 'Server Error. Please try again later.';
}
