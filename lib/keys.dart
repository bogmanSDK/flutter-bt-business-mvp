import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

abstract class BTKeys {
  static const LOGIN_USERNAME_INPUT = Key('login_user_name');
  static const LOGIN_PASSWORD_INPUT = Key('login_password');
  static const LOGIN_ACTION_BUTTON = Key('login_action_button');
  static const LOGIN_FORGOT_PASSWORD = Key('login_forgot_password');

  static const SECURITY_ONE_OFF_CODE_INPUT = Key('security_check_input');
  static const SECURITY_CHECK_NEXT_BUTTON = Key('security_check_next');
  static const SECURITY_CHECK_CANCEL_BUTTON = Key('security_check_cancel');

  static const SECURITY_NUMBER_INPUT = Key('security_number_input');
  static const SECURITY_NUMBER_CONFIRM_INPUT = Key('security_number_confirm_input');
  static const SECURITY_NUMBER_ACTION_BUTTON = Key('security_number_action_button');




}
