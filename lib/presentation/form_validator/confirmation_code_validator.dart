abstract class CodeFieldValidators {
  static String? securityNumberValidator(String? code, String errorMessage) {
    if (code == null || code.isEmpty || code.length < 8) {
      return errorMessage;
    }
    return null;
  }

  static String? securityNumberMatchValidator(
      {String? code, String? confirmCode, required String errorMessage}) {
    if (code != confirmCode) {
      return errorMessage;
    }
    return null;
  }
}
