const _EMAIL_PATTERN = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
// final pattern = r"^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$";

abstract class EmailFieldValidators {
  static String? validateEmail(String? email, String errorMessage) {
    final regex = RegExp(_EMAIL_PATTERN);
    if (email == null || !regex.hasMatch(email)) {
      return errorMessage;
    } else {
      return null;
    }
  }
}
