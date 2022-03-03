import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:bt_business/presentation/styling/dimension.dart';
import 'package:bt_business/presentation/styling/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color.dart';
import 'input_borders.dart';

abstract class BTTheme {
  static final lightTheme = ThemeData(
    primaryColor: BTColors.mainBackgroundWhiteColor,
    backgroundColor: BTColors.mainBackgroundLightColor,
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    splashColor: BTColors.indigoDefaultColor,
    scaffoldBackgroundColor: BTColors.mainBackgroundLightColor,
    textTheme: const TextTheme(
      headline1: BTStyleLight.headline,
      headline2: BTStyleLight.titleBig,
      headline3: BTStyleLight.titleSmall,
      headline6: BTStyleLight.headTitleStyle,
      // use for Head title
      subtitle1: BTStyleLight.subTitleBig,
      subtitle2: BTStyleLight.subTitleSmall,
      bodyText1: BTStyleLight.bodyText,
      bodyText2: BTStyleLight.descriptionText,
      button: BTStyleLight.bodyText,
      caption: BTStyleLight.footNoteText,
      overline: BTStyleLight.overLineText,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: BTColors.lightBorderFocusColor,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      isDense: true,
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      enabledBorder: BTInputBorders.enableInputBorderLight,
      errorBorder: BTInputBorders.errorInputBorderLight,
      focusedErrorBorder: BTInputBorders.focusedInputBorderLight,
      focusedBorder: BTInputBorders.focusedInputBorderLight,
      filled: true,
      fillColor: BTColors.mainBackgroundWhiteColor,
      labelStyle: BTStyleLight.bodyText,
      hintStyle: BTStyleLight.hintText,
      errorStyle: BTStyleLight.errorText,
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: BTColors.mainBackgroundDarkColor,
    backgroundColor: BTColors.mainBackgroundBlackColor,
    splashColor: BTColors.paleIndigoSelectedColor,
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: BTColors.mainBackgroundBlackColor,
    textTheme: TextTheme(
      headline1: BTStyleDark.headline,
      headline2: BTStyleDark.titleBig,
      headline3: BTStyleDark.titleSmall,
      headline6: BTStyleDark.headTitleStyle,
      // use for Head title
      subtitle1: BTStyleDark.subTitleBig,
      subtitle2: BTStyleDark.subTitleSmall,
      bodyText1: BTStyleDark.bodyText,
      bodyText2: BTStyleDark.descriptionText,
      button: BTStyleDark.bodyText,
      caption: BTStyleDark.footNoteText,
      overline: BTStyleDark.overLineText,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: BTColors.darkBorderFocusColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      enabledBorder: BTInputBorders.enableInputBorderDark,
      errorBorder: BTInputBorders.errorInputBorderDark,
      focusedErrorBorder: BTInputBorders.focusedInputBorderDark,
      focusedBorder: BTInputBorders.focusedInputBorderDark,
      filled: true,
      fillColor: BTColors.mainBackgroundDarkColor,
      labelStyle: BTStyleDark.bodyText,
      hintStyle: BTStyleDark.hintText,
      errorStyle: BTStyleDark.errorText,
    ),
  );

  static final primaryCTAButtonStyleLight = ElevatedButton.styleFrom(
    textStyle: BTStyleLight.bodyText,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(BTDimensions.buttonBorderRadius),
    ),
    primary: BTColors.indigoDefaultColor,
  );

  static final primaryCTAButtonStyleDark = ElevatedButton.styleFrom(
    textStyle: BTStyleDark.bodyText,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(BTDimensions.buttonBorderRadius),
    ),
    primary: BTColors.indigo05Color,
  );

  static final primaryOutlineButtonStyleLight = OutlinedButton.styleFrom(
    textStyle: BTStyleLight.bodyText,
    primary: BTColors.indigoDefaultColor,
    side: const BorderSide(
      width: BTDimensions.atomic,
      color: BTColors.indigoDefaultColor,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(BTDimensions.buttonBorderRadius),
    ),
    //primary: BTColors.indigoDefaultColor,
  );

  static final primaryOutlineButtonStyleDark = OutlinedButton.styleFrom(
    textStyle: BTStyleDark.bodyText,
    primary: BTColors.paleIndigoDefaultColor,
    side: const BorderSide(
      width: BTDimensions.atomic,
      color: BTColors.paleIndigoDefaultColor,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(BTDimensions.buttonBorderRadius),
    ),
    //primary: BTColors.indigoDefaultColor,
  );
}
