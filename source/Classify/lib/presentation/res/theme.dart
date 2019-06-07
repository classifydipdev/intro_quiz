import 'package:classify/presentation/res/colors.dart';
import 'package:classify/presentation/res/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeApp {

  static TextStyle get picoGreyTextStyle {
    return TextStyle(
      fontFamily: 'GoogleSans',
      fontSize: DimensApp.textSizePico,
      color: Colors.grey[400],
    );
  }

  static ThemeData data = ThemeData(
    primaryColorDark: ColorsApp.primaryDark,
    primaryColor: ColorsApp.primary,
    accentColor: ColorsApp.accent,
    canvasColor: Colors.transparent,
  );

  static TextStyle get littleWhiteTextStyle {
    return TextStyle(
      fontFamily: 'GoogleSans',
      fontSize: DimensApp.textSizeLittle,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get littleOrangeTextStyle {
    return TextStyle(
      fontFamily: 'GoogleSans',
      fontSize: DimensApp.textSizeLittle,
      color: ColorsApp.textCardOrange,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get littleYellowTextStyle {
    return TextStyle(
      fontFamily: 'GoogleSans',
      fontSize: DimensApp.textSizeLittle,
      color: ColorsApp.textCardYellow,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get littleGreenTextStyle {
    return TextStyle(
      fontFamily: 'GoogleSans',
      fontSize: DimensApp.textSizeLittle,
      color: ColorsApp.textCardGreen,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get smallFadeWhiteBoldTextStyle {
    return TextStyle(
      fontFamily: 'GoogleSans',
      fontSize: DimensApp.textSizeSmall,
      color: Colors.white70,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle get smallWhiteTextStyle {
    return TextStyle(
      fontFamily: 'GoogleSans',
      fontSize: DimensApp.textSizeSmall,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get smallWhiteThinkTextStyle {
    return TextStyle(
      fontFamily: 'GoogleSans',
      fontSize: 13,
      color: Colors.white,
    );
  }

  static TextStyle get smallBlackTextStyle {
    return TextStyle(
      fontFamily: 'GoogleSans',
      fontSize: DimensApp.textSizeSmall,
      color: Colors.black,
    );
  }

  static TextStyle get middleGreyBoldTextStyle {
    return TextStyle(
      fontFamily: 'GoogleSans',
      fontSize: DimensApp.textSizeMiddle,
      color: Colors.black54,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get middleGreyTextStyle {
    return TextStyle(
      fontFamily: 'GoogleSans',
      fontSize: DimensApp.textSizeMiddle,
      color: Colors.black26,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle get middleWhiteBoldTextStyle {
    return TextStyle(
      fontFamily: 'GoogleSans',
      fontSize: DimensApp.textSizeMiddle,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle get middleExtraWhiteBoldTextStyle {
    return TextStyle(
      fontFamily: 'GoogleSans',
      fontSize: DimensApp.textSizeMiddleExtra,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle get middleExtraBlackTextStyle {
    return TextStyle(
      fontFamily: 'GoogleSans',
      fontSize: DimensApp.textSizeMiddleExtra,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle get bigWhiteBoldTextStyle {
    return TextStyle(
      fontFamily: 'GoogleSans',
      fontSize: DimensApp.textSizeBig,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }
}
