// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
class Validator {
  static bool validateUserName(String userName) {
    return userName.isNotEmpty;
  }
  static bool validatePassword(String password) {
    return password.isNotEmpty && password.length >= 8;
  }
}
void main() {
  group('validateUserName', () {
    test('validateUserName should return true when the userName is not empty', () {
      String invalidUserName = 'nabeel';

      // Act
      bool result = Validator.validateUserName(invalidUserName);

      // Assert
      expect(result, true);
    });

    test('validateEmail should return false when the userName is empty', () {
      String invalidUserName = '';

      // Act
      bool result = Validator.validateUserName(invalidUserName);

      // Assert
      expect(result, false);
    });
  });

  group('validatePassword', () {
    test('validatePassword should return true when the password is not empty '
        'and length is greater than or equal to 8', () {
      String validPassword = 'password123';

      // Act
      bool result = Validator.validatePassword(validPassword);

      // Assert
      expect(result, true);
    });

  test('validatePassword should return false when the password is empty '
      'and length is less than 8', () {
    String validPassword = '1324567';

    // Act
    bool result = Validator.validatePassword(validPassword);

    // Assert
    expect(result, false);
  });
});
}
