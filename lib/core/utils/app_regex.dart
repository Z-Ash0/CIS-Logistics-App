class AppRegex {
  AppRegex._();

  //* Validates email format
  static bool isEmailValid(String email) {
    return RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(email);
  }

  //* Validates password format
  static bool isPasswordValid(String password) {
    return RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    ).hasMatch(password);
  }

  //* Checks if password contains at least one lowercase letter
  static bool hasLowerCase(String password) {
    return RegExp(r'[a-z]').hasMatch(password);
  }

  //* Checks if password contains at least one uppercase letter
  static bool hasUpperCase(String password) {
    return RegExp(r'[A-Z]').hasMatch(password);
  }

  //* Checks if password contains at least one number
  static bool hasNumber(String password) {
    return RegExp(r'[0-9]').hasMatch(password);
  }

  //* Checks if password contains at least one special character
  static bool hasSpecialCharacter(String password) {
    return RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);
  }

  //* Checks if password meets minimum length requirement (8 characters)
  static bool hasMinLength(String password) {
    return RegExp(r'^.{8,}$').hasMatch(password);
  }
}
