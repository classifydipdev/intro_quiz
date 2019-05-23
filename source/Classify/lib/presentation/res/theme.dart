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

  static TextStyle get titleSmallItalicTextStyle {
    return TextStyle(
      fontSize: DimensApp.textSizeMiddle,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      decoration: TextDecoration.none,
    );
  }
}
