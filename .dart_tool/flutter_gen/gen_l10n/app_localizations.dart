
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations returned
/// by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @app_name.
  ///
  /// In en, this message translates to:
  /// **'BT Business'**
  String get app_name;

  /// No description provided for @emailOrUserNameLabelText.
  ///
  /// In en, this message translates to:
  /// **'Email or username'**
  String get emailOrUserNameLabelText;

  /// No description provided for @passwordLabelText.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabelText;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get login;

  /// No description provided for @forgot.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get forgot;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @notYetSetUp.
  ///
  /// In en, this message translates to:
  /// **'Not yet set up? '**
  String get notYetSetUp;

  /// No description provided for @securityCheckTitle.
  ///
  /// In en, this message translates to:
  /// **'Thanks for logging in!'**
  String get securityCheckTitle;

  /// No description provided for @securityCheckDescription.
  ///
  /// In en, this message translates to:
  /// **'For security, we provided you with a one-off code over the phone, or sent it by SMS. Please enter the code below. If you can’t remember it, just tap Resend.  We\'ll send you a new PIN to your mobile by SMS.'**
  String get securityCheckDescription;

  /// No description provided for @oneOffCode.
  ///
  /// In en, this message translates to:
  /// **'One-off code'**
  String get oneOffCode;

  /// No description provided for @nextButton.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get nextButton;

  /// No description provided for @cancelButton.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelButton;

  /// No description provided for @confirmButton.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirmButton;

  /// No description provided for @securityCheckHeader.
  ///
  /// In en, this message translates to:
  /// **'Security check'**
  String get securityCheckHeader;

  /// No description provided for @securityNumberHeader.
  ///
  /// In en, this message translates to:
  /// **'Security number'**
  String get securityNumberHeader;

  /// No description provided for @securityNumberTitle.
  ///
  /// In en, this message translates to:
  /// **'Set your security number'**
  String get securityNumberTitle;

  /// No description provided for @securityNumberDescription.
  ///
  /// In en, this message translates to:
  /// **'You’ll need use your 8-digit security number when contacting BT, or if you forget your password. Please enter numbers only.'**
  String get securityNumberDescription;

  /// No description provided for @pleaseEnterSecurityNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter your 8-digit security number'**
  String get pleaseEnterSecurityNumber;

  /// No description provided for @pleaseConfirmSecurityNumber.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your 8-digit security number'**
  String get pleaseConfirmSecurityNumber;

  /// No description provided for @emptyPasswordMessage.
  ///
  /// In en, this message translates to:
  /// **'Please enter a password'**
  String get emptyPasswordMessage;

  /// No description provided for @emptySecurityPinMessage.
  ///
  /// In en, this message translates to:
  /// **'Please enter the code received in SMS'**
  String get emptySecurityPinMessage;

  /// No description provided for @emailInvalidMessage.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address'**
  String get emailInvalidMessage;

  /// No description provided for @emptySecurityNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter 8-digit security number'**
  String get emptySecurityNumber;

  /// No description provided for @securityNumberMatchError.
  ///
  /// In en, this message translates to:
  /// **'Security numbers do not match'**
  String get securityNumberMatchError;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
