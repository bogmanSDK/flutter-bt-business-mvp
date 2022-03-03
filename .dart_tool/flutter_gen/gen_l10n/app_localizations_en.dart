


import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_name => 'BT Business';

  @override
  String get emailOrUserNameLabelText => 'Email or username';

  @override
  String get passwordLabelText => 'Password';

  @override
  String get login => 'Log in';

  @override
  String get forgot => 'Forgot your password?';

  @override
  String get register => 'Register';

  @override
  String get notYetSetUp => 'Not yet set up? ';

  @override
  String get securityCheckTitle => 'Thanks for logging in!';

  @override
  String get securityCheckDescription => 'For security, we provided you with a one-off code over the phone, or sent it by SMS. Please enter the code below. If you can’t remember it, just tap Resend.  We\'ll send you a new PIN to your mobile by SMS.';

  @override
  String get oneOffCode => 'One-off code';

  @override
  String get nextButton => 'Next';

  @override
  String get cancelButton => 'Cancel';

  @override
  String get confirmButton => 'Confirm';

  @override
  String get securityCheckHeader => 'Security check';

  @override
  String get securityNumberHeader => 'Security number';

  @override
  String get securityNumberTitle => 'Set your security number';

  @override
  String get securityNumberDescription => 'You’ll need use your 8-digit security number when contacting BT, or if you forget your password. Please enter numbers only.';

  @override
  String get pleaseEnterSecurityNumber => 'Please enter your 8-digit security number';

  @override
  String get pleaseConfirmSecurityNumber => 'Please confirm your 8-digit security number';

  @override
  String get emptyPasswordMessage => 'Please enter a password';

  @override
  String get emptySecurityPinMessage => 'Please enter the code received in SMS';

  @override
  String get emailInvalidMessage => 'Invalid email address';

  @override
  String get emptySecurityNumber => 'Please enter 8-digit security number';

  @override
  String get securityNumberMatchError => 'Security numbers do not match';
}
