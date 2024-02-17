part of "./index.dart";

class PasswordValidations {
  final int minPasswordLength;
  PasswordValidations([this.minPasswordLength = 8]);

  // At least one uppercase letter
  RegExp hasUppercase = RegExp(r'[A-Z]');

  // At least one lowercase letter
  RegExp hasLowercase = RegExp(r'[a-z]');

  // At least one number
  RegExp hasNumber = RegExp(r'\d');

  // At least one special character
  RegExp hasSpecialChar = RegExp(r'[!@#$%^&*()_+{}|:;<>,.?~\\-]');

  String? validateFull(String? password) {
    if (null == password) return null;
    if (password.isEmpty) return "Required.";
    if (!hasUppercase.hasMatch(password)) return "Password must contain one Upper case letter.";
    if (!hasLowercase.hasMatch(password)) return "Password must contain one Lower case letter.";
    if (!hasNumber.hasMatch(password)) return "Password must contain one Number.";
    if (!hasSpecialChar.hasMatch(password)) return "Password must contain one Special character.";
    if (password.length < minPasswordLength) return "Password length must be min $minPasswordLength.";
    return null;
  }
}
