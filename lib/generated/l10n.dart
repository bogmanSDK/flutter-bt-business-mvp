// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `BT Business`
  String get app_name {
    return Intl.message(
      'BT Business',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Email or username`
  String get emailOrUserNameLabelText {
    return Intl.message(
      'Email or username',
      name: 'emailOrUserNameLabelText',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordLabelText {
    return Intl.message(
      'Password',
      name: 'passwordLabelText',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get login {
    return Intl.message(
      'Log in',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get forgot {
    return Intl.message(
      'Forgot your password?',
      name: 'forgot',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Not yet set up? `
  String get notYetSetUp {
    return Intl.message(
      'Not yet set up? ',
      name: 'notYetSetUp',
      desc: '',
      args: [],
    );
  }

  /// `Thanks for logging in!`
  String get securityCheckTitle {
    return Intl.message(
      'Thanks for logging in!',
      name: 'securityCheckTitle',
      desc: '',
      args: [],
    );
  }

  /// `For security, we provided you with a one-off code over the phone, or sent it by SMS. Please enter the code below. If you can’t remember it, just tap Resend.  We'll send you a new PIN to your mobile by SMS.`
  String get securityCheckDescription {
    return Intl.message(
      'For security, we provided you with a one-off code over the phone, or sent it by SMS. Please enter the code below. If you can’t remember it, just tap Resend.  We\'ll send you a new PIN to your mobile by SMS.',
      name: 'securityCheckDescription',
      desc: '',
      args: [],
    );
  }

  /// `One-off code`
  String get oneOffCode {
    return Intl.message(
      'One-off code',
      name: 'oneOffCode',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get nextButton {
    return Intl.message(
      'Next',
      name: 'nextButton',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancelButton {
    return Intl.message(
      'Cancel',
      name: 'cancelButton',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirmButton {
    return Intl.message(
      'Confirm',
      name: 'confirmButton',
      desc: '',
      args: [],
    );
  }

  /// `Security check`
  String get securityCheckHeader {
    return Intl.message(
      'Security check',
      name: 'securityCheckHeader',
      desc: '',
      args: [],
    );
  }

  /// `Security number`
  String get securityNumberHeader {
    return Intl.message(
      'Security number',
      name: 'securityNumberHeader',
      desc: '',
      args: [],
    );
  }

  /// `Set your security number`
  String get securityNumberTitle {
    return Intl.message(
      'Set your security number',
      name: 'securityNumberTitle',
      desc: '',
      args: [],
    );
  }

  /// `You’ll need use your 8-digit security number when contacting BT, or if you forget your password. Please enter numbers only.`
  String get securityNumberDescription {
    return Intl.message(
      'You’ll need use your 8-digit security number when contacting BT, or if you forget your password. Please enter numbers only.',
      name: 'securityNumberDescription',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your 8-digit security number`
  String get pleaseEnterSecurityNumber {
    return Intl.message(
      'Please enter your 8-digit security number',
      name: 'pleaseEnterSecurityNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your 8-digit security number`
  String get pleaseConfirmSecurityNumber {
    return Intl.message(
      'Please confirm your 8-digit security number',
      name: 'pleaseConfirmSecurityNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a password`
  String get emptyPasswordMessage {
    return Intl.message(
      'Please enter a password',
      name: 'emptyPasswordMessage',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the code received in SMS`
  String get emptySecurityPinMessage {
    return Intl.message(
      'Please enter the code received in SMS',
      name: 'emptySecurityPinMessage',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email address`
  String get emailInvalidMessage {
    return Intl.message(
      'Invalid email address',
      name: 'emailInvalidMessage',
      desc: '',
      args: [],
    );
  }

  /// `Please enter 8-digit security number`
  String get emptySecurityNumber {
    return Intl.message(
      'Please enter 8-digit security number',
      name: 'emptySecurityNumber',
      desc: '',
      args: [],
    );
  }

  /// `Security numbers do not match`
  String get securityNumberMatchError {
    return Intl.message(
      'Security numbers do not match',
      name: 'securityNumberMatchError',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
