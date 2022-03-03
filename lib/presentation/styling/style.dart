import 'package:flutter/material.dart';

import 'color.dart';
import 'font.dart';

abstract class BTStyleLight {
  static const headline = TextStyle(
    color: BTColors.lightTextDefaultColor,
    fontSize: 56,
    fontFamily: BrandedFont.btCurveHeadline,
  );

  static const titleBig = TextStyle(
    color: BTColors.lightTextDefaultColor,
    fontSize: 36,
    fontFamily: BrandedFont.btCurveHeadline,
  );

  static const titleSmall = TextStyle(
    color: BTColors.lightTextDefaultColor,
    fontSize: 28,
    fontFamily: BrandedFont.btCurveHeadline,
  );

  static const subTitleBig = TextStyle(
    color: BTColors.lightTextDefaultColor,
    fontSize: 24,
    fontFamily: BrandedFont.btCurveHeadline,
  );

  static const subTitleSmall = TextStyle(
    color: BTColors.lightTextDefaultColor,
    fontSize: 16,
    fontFamily: BrandedFont.btCurveHeadline,
  );

  static const bodyText = TextStyle(
    color: BTColors.lightTextDefaultColor,
    fontSize: 16,
    fontFamily: BrandedFont.btCurveRegular,
  );

  static const hintText = TextStyle(
    color: BTColors.lightTextMutedColor,
    fontSize: 16,
    fontFamily: BrandedFont.btCurveRegular,
  );

  static const errorText = TextStyle(
    color: BTColors.lightStatusRedFailureColor,
    fontSize: 14,
    fontFamily: BrandedFont.btCurveRegular,
  );

  static const buttonText = TextStyle(
    color: BTColors.lightTextDefaultColor,
    fontSize: 16,
    fontFamily: BrandedFont.btCurveRegular,
  );

  static const descriptionText = TextStyle(
    color: BTColors.lightTextDefaultColor,
    fontSize: 14,
    fontFamily: BrandedFont.btCurveRegular,
  );

  static const footNoteText = TextStyle(
    color: BTColors.lightTextDefaultColor,
    fontSize: 12,
    fontFamily: BrandedFont.btCurveRegular,
  );

  static const overLineText = TextStyle(
    color: BTColors.indigoDefaultColor,
    fontSize: 14,
    fontFamily: BrandedFont.btCurveRegular,
    decoration: TextDecoration.underline,
  );

  static const headTitleStyle = TextStyle(
    color: BTColors.indigoDefaultColor,
    fontSize: 16,
    fontFamily: BrandedFont.btCurveRegular,
  );
}

abstract class BTStyleDark {
  static final headline = BTStyleLight.headline.copyWith(
    color: BTColors.darkTextDefaultColor,
  );

  static final titleBig = BTStyleLight.titleBig.copyWith(
    color: BTColors.darkTextDefaultColor,
  );

  static const titleSmall = TextStyle(
    color: BTColors.darkTextDefaultColor,
    fontSize: 28,
    fontFamily: BrandedFont.btCurveHeadline,
  );

  static const subTitleBig = TextStyle(
    color: BTColors.darkTextDefaultColor,
    fontSize: 24,
    fontFamily: BrandedFont.btCurveHeadline,
  );

  static const subTitleSmall = TextStyle(
    color: BTColors.darkTextDefaultColor,
    fontSize: 16,
    fontFamily: BrandedFont.btCurveHeadline,
  );

  static const bodyText = TextStyle(
    color: BTColors.darkTextDefaultColor,
    fontSize: 16,
    fontFamily: BrandedFont.btCurveRegular,
  );

  static const hintText = TextStyle(
    color: BTColors.darkTextMutedColor,
    fontSize: 16,
    fontFamily: BrandedFont.btCurveRegular,
  );

  static const errorText = TextStyle(
    color: BTColors.darkStatusRedFailureColor,
    fontSize: 14,
    fontFamily: BrandedFont.btCurveRegular,
  );

  static const descriptionText = TextStyle(
    color: BTColors.darkTextDefaultColor,
    fontSize: 14,
    fontFamily: BrandedFont.btCurveRegular,
  );

  static const footNoteText = TextStyle(
    color: BTColors.darkTextDefaultColor,
    fontSize: 12,
    fontFamily: BrandedFont.btCurveRegular,
  );

  static final headTitleStyle = BTStyleLight.headTitleStyle.copyWith(
    color: BTColors.paleIndigoSelectedColor,
  );

  static final overLineText =
      BTStyleLight.overLineText.copyWith(color: BTColors.paleIndigoDefaultColor);
}
