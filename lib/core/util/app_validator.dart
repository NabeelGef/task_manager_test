

import 'package:easy_localization/easy_localization.dart';
import '../strings/failures.dart';

// validations
class AppValidator {
  static String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return FailureMessages.empty.tr();
    }
    if (!(RegExp(r'^\+?[0-9]{6,}$').hasMatch(value))) {
      return FailureMessages.invalidPhone.tr();
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return FailureMessages.empty.tr();
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return FailureMessages.invalidEmail.tr();
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return FailureMessages.empty.tr();
    }
    return null;
  }

  static String? stringValidator(String? value, {int length = 4}) {
    if (value == null || value.isEmpty) {
      return FailureMessages.empty.tr();
    }

    if ((value.length < length)) {
      return "can't be less @length than Letter";
    }
    return null;
  }

  static String? otpValidator(String? value) {
    if (value == null || value.isEmpty) {
      return FailureMessages.empty.tr();
    }
    if ((value.length != 4)) {
      return FailureMessages.invalidOTP;
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return FailureMessages.empty.tr();
    }
    if ((value.length < 8)) return FailureMessages.invalidPass;

    return null;
  }

  static String? matchPassword(String? value1, String value2) {
    if (value1 != value2) return FailureMessages.passwordDoesNotMatch;
    return passwordValidator(value1);
  }
}
