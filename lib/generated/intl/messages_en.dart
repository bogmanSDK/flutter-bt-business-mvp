// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "app_name": MessageLookupByLibrary.simpleMessage("BT Business"),
        "cancelButton": MessageLookupByLibrary.simpleMessage("Cancel"),
        "confirmButton": MessageLookupByLibrary.simpleMessage("Confirm"),
        "emailInvalidMessage":
            MessageLookupByLibrary.simpleMessage("Invalid email address"),
        "emailOrUserNameLabelText":
            MessageLookupByLibrary.simpleMessage("Email or username"),
        "emptyPasswordMessage":
            MessageLookupByLibrary.simpleMessage("Please enter a password"),
        "emptySecurityNumber": MessageLookupByLibrary.simpleMessage(
            "Please enter 8-digit security number"),
        "emptySecurityPinMessage": MessageLookupByLibrary.simpleMessage(
            "Please enter the code received in SMS"),
        "forgot": MessageLookupByLibrary.simpleMessage("Forgot your password?"),
        "login": MessageLookupByLibrary.simpleMessage("Log in"),
        "nextButton": MessageLookupByLibrary.simpleMessage("Next"),
        "notYetSetUp": MessageLookupByLibrary.simpleMessage("Not yet set up? "),
        "oneOffCode": MessageLookupByLibrary.simpleMessage("One-off code"),
        "passwordLabelText": MessageLookupByLibrary.simpleMessage("Password"),
        "pleaseConfirmSecurityNumber": MessageLookupByLibrary.simpleMessage(
            "Please confirm your 8-digit security number"),
        "pleaseEnterSecurityNumber": MessageLookupByLibrary.simpleMessage(
            "Please enter your 8-digit security number"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "securityCheckDescription": MessageLookupByLibrary.simpleMessage(
            "For security, we provided you with a one-off code over the phone, or sent it by SMS. Please enter the code below. If you can’t remember it, just tap Resend.  We\'ll send you a new PIN to your mobile by SMS."),
        "securityCheckHeader":
            MessageLookupByLibrary.simpleMessage("Security check"),
        "securityCheckTitle":
            MessageLookupByLibrary.simpleMessage("Thanks for logging in!"),
        "securityNumberDescription": MessageLookupByLibrary.simpleMessage(
            "You’ll need use your 8-digit security number when contacting BT, or if you forget your password. Please enter numbers only."),
        "securityNumberHeader":
            MessageLookupByLibrary.simpleMessage("Security number"),
        "securityNumberMatchError": MessageLookupByLibrary.simpleMessage(
            "Security numbers do not match"),
        "securityNumberTitle":
            MessageLookupByLibrary.simpleMessage("Set your security number")
      };
}
