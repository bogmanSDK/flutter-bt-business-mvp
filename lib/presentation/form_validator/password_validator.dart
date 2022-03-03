import 'package:bt_business/data/models/password_constraint/password_validation_constraints.dart';

const _NUMBER_PATTERN = r'[0-9]';
const _EMAIL_PATTERN = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])[a-zA-Z\d\P{L}]{8,}$';
const _MIN_LENGTH = 8;

abstract class PasswordFieldValidators {
  static PasswordConstraintModel getValidationState(String password) {
    final regex = RegExp(
      _EMAIL_PATTERN,
      unicode: true,
    );

    if (regex.hasMatch(password)) {
      return PasswordConstraintModel.valid();
    } else {
      return PasswordConstraintModel(
        meetsLengthRequirement: password.length >= _MIN_LENGTH,
        meetsUpperCaseRequirement: password.toLowerCase() != password,
        meetsLowerCaseRequirement: password.toUpperCase() != password,
        meetsNumberRequirement: password.contains(RegExp(_NUMBER_PATTERN)),
      );
    }
  }

  static String? validatePasswordLogin(String? password, String errorMessage) {
    // The password for login should not be empty, so...
    if (password == null || password.isEmpty) {
      return errorMessage;
    }
    return null;
  }
}
