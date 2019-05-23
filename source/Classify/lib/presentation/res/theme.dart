import 'package:classify/presentation/res/colors.dart';
import 'package:classify/presentation/res/dimens.dart';
import 'package:flutter/material.dart';

class ThemeApp {
  static ThemeData data = ThemeData(
    primaryColorDark: ColorsApp.primaryDark,
    primaryColor: ColorsApp.primary,
    accentColor: ColorsApp.accent,
    canvasColor: Colors.transparent,
  );

  static TextStyle get smallFadeWhiteBoldTextStyle {
    return TextStyle(
      fontFamily: 'GoogleSans',
      fontSize: DimensApp.textSizeSmall,
      color: Colors.white70,
      fontWeight: FontWeight.bold,
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

  static TextStyle get bigWhiteBoldTextStyle {
    return TextStyle(
      fontFamily: 'GoogleSans',
      fontSize: DimensApp.textSizeBig,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }
}
