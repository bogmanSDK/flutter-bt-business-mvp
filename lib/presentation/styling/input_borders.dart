import 'package:flutter/material.dart';

import 'color.dart';
import 'dimension.dart';

abstract class BTInputBorders {
  static const borderRadius = BorderRadius.all(Radius.circular(BTDimensions.textFieldBorderRadius));

  static const enableInputBorderLight = OutlineInputBorder(
    borderRadius: borderRadius,
    borderSide: BorderSide(
      color: BTColors.lightBorderDefaultColor,
      width: BTDimensions.textFieldBorderWidth,
    ),
  );

  static final enableInputBorderDark = enableInputBorderLight.copyWith(
    borderSide: const BorderSide(
      color: BTColors.darkBorderDefaultColor,
      width: BTDimensions.textFieldBorderWidth,
    ),
  );

  static const focusedInputBorderLight = OutlineInputBorder(
    borderRadius: borderRadius,
    borderSide: BorderSide(
      width: BTDimensions.textFieldBorderWidth,
      color: BTColors.lightBorderFocusColor,
    ),
  );

  static final focusedInputBorderDark = focusedInputBorderLight.copyWith(
    borderSide: const BorderSide(
      width: BTDimensions.textFieldBorderWidth,
      color: BTColors.darkBorderFocusColor,
    ),
  );

  static const errorInputBorderLight = OutlineInputBorder(
    borderRadius: borderRadius,
    borderSide: BorderSide(
      width: BTDimensions.textFieldBorderWidth,
      color: BTColors.lightStatusRedFailureColor,
    ),
  );

  static const errorInputBorderDark = OutlineInputBorder(
    borderRadius: borderRadius,
    borderSide: BorderSide(
      width: BTDimensions.textFieldBorderWidth,
      color: BTColors.darkStatusRedFailureColor,
    ),
  );
}
