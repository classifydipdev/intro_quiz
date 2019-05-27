import 'package:classify/data/entities/subject.dart';
import 'package:classify/presentation/res/dimens.dart';
import 'package:flutter/material.dart';

Widget getSubjectButton(Subject subject, Function(bool) onTap,
    {bool isSelected = false, bool isBorder = true, Function onLongPress}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: DimensApp.paddingSmall),
    height: DimensApp.sizeMiddleExtra,
    child: InkWell(
      onTap: () {
        onTap(!isSelected);
      },
      onLongPress: onLongPress,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: DimensApp.paddingSmall),
        decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [subject.colorStart, subject.colorEnd]),
          border: Border.all(
              color: Color.fromRGBO(
                  255, 255, 255, isSelected && isBorder ? 1.0 : 0.0),
              width: 2.0),
          borderRadius:
              BorderRadius.circular(DimensApp.borderRadiusMiddleExtra),
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: DimensApp.paddingMiddle),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  subject.name,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'GoogleSans',
                  ),
                ),
              ],
            )),
      ),
    ),
  );
}
