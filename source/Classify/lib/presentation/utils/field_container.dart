import 'package:classify/presentation/res/dimens.dart';
import 'package:classify/presentation/res/theme.dart';
import 'package:flutter/material.dart';

Widget getFieldContainer(String name, String description,
    TextEditingController controller, Function validator,
    {Widget trailingWidget, bool obscureText = false}) {
  return Container(
    margin: EdgeInsets.only(
        left: DimensApp.paddingLarge, right: DimensApp.paddingLarge),
    child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: DimensApp.paddingMiddle, bottom: 7.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(name, style: ThemeApp.smallWhiteTextStyle),
          ),
        ),
        TextFormField(
          style: ThemeApp.smallWhiteTextStyle,
          autofocus: false,
          validator: validator,
          controller: controller,
          obscureText: obscureText,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            
            suffix: trailingWidget != null
                ? trailingWidget
                : Container(
                    height: 0,
                    width: 0,
                  ),
            hintText: description,
            focusedErrorBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(DimensApp.borderRadiusMiddleExtra),
                borderSide: BorderSide(color: Colors.red, width: 1.0)),
            errorBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(DimensApp.borderRadiusMiddleExtra),
                borderSide: BorderSide(color: Colors.red, width: 1.0)),
            hintStyle: TextStyle(color: Colors.white),
            contentPadding: EdgeInsets.fromLTRB(
                DimensApp.paddingMiddle,
                DimensApp.paddingSmallExtra,
                DimensApp.paddingMiddleExtra,
                DimensApp.paddingSmall),
            enabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(DimensApp.borderRadiusMiddleExtra),
                borderSide: BorderSide(color: Colors.white, width: 1.0)),
            focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(DimensApp.borderRadiusMiddleExtra),
                borderSide: BorderSide(color: Colors.white, width: 1.0)),
          ),
        ),
      ],
    ),
  );
}
