import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:cis_logistics_app/core/utils/app_regex.dart';
import 'package:cis_logistics_app/core/utils/app_strings.dart';

class AppValidators {
  AppValidators._();

  //* Email validation
  static String? emailValidator(String? value) {
    if (value.isNullOrEmpty()) {
      return AppStrings.enterEmailAddress;
    }

    if (!AppRegex.isEmailValid(value!.trim())) {
      return AppStrings.enterValidEmail;
    }

    return null;
  }

  //* Password Validation
  static String? passwordValidator(String? value) {
    if (value.isNullOrEmpty()) {
      return AppStrings.enterPassword;
    }
    return null;
  }

  // New password validation
  static String? newPasswordValidator(String? value) {
    if (value.isNullOrEmpty()) {
      return AppStrings.enterPassword;
    }

    // Check minimum length
    if (!AppRegex.hasMinLength(value!)) {
      return AppStrings.passwordTooShort;
    }

    // Check maximum length
    if (value.length > 50) {
      return AppStrings.passwordTooLong;
    }

    // Check for at least one uppercase letter
    if (!AppRegex.hasUpperCase(value)) {
      return AppStrings.passwordMissingUppercase;
    }

    // Check for at least one lowercase letter
    if (!AppRegex.hasLowerCase(value)) {
      return AppStrings.passwordMissingLowercase;
    }

    // Check for at least one number
    if (!AppRegex.hasNumber(value)) {
      return AppStrings.passwordMissingNumber;
    }

    // Check for at least one special character
    if (!AppRegex.hasSpecialCharacter(value)) {
      return AppStrings.passwordMissingSpecialChar;
    }

    return null;
  }

  //* Confirm password validation
  static String? confirmPasswordValidator(
    String? value,
    String? originalPassword,
  ) {
    if (value.isNullOrEmpty()) {
      return AppStrings.enterConfirmPassword;
    }

    if (value != originalPassword) {
      return AppStrings.passwordsDoNotMatch;
    }

    return null;
  }

  //* OTP digit validation
  static String? otpDigitValidator(String? value) {
    if (value.isNullOrEmpty()) {
      return AppStrings.enterDigit;
    }
    return null;
  }

  //* General required field validation
  static String? requiredFieldValidator(String? value, String fieldName) {
    if (value.isNullOrEmpty()) {
      return 'Please enter $fieldName';
    }
    return null;
  }
}
