import 'package:flutter/cupertino.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

Widget verticalSpacing(double height) => SizedBox(height: height);

Widget horizontalSpacing(double width) => SizedBox(width: width);

final securityNumberMaskFormatter = MaskTextInputFormatter(
  mask: '########',
  filter: {"#": RegExp(r'[0-9]')},
  type: MaskAutoCompletionType.lazy,
);

final oneOffCodeMaskFormatter = MaskTextInputFormatter(
  mask: '####',
  filter: {"#": RegExp(r'[0-9]')},
  type: MaskAutoCompletionType.lazy,
);

void hideKeyboard() => FocusManager.instance.primaryFocus?.unfocus();
