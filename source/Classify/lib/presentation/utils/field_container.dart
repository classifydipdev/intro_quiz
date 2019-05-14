import 'package:flutter/material.dart';

Widget getFieldContainer(String name, String description,
    TextEditingController controller, Function validator,
    {Widget trailingWidget, bool obscureText = false}) {
  return Container(
    margin: EdgeInsets.only(left: 65.0, right: 65.0),
    child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 20.0, bottom: 5.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(name, style: TextStyle(color: Colors.white)),
          ),
        ),
        TextFormField(
          style: TextStyle(color: Colors.white),
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
                borderRadius: BorderRadius.circular(35.0),
                borderSide: BorderSide(color: Colors.red, width: 1.0)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35.0),
                borderSide: BorderSide(color: Colors.red, width: 1.0)),
            hintStyle: TextStyle(color: Colors.white),
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 25.0, 10.0),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35.0),
                borderSide: BorderSide(color: Colors.white, width: 1.0)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35.0),
                borderSide: BorderSide(color: Colors.white, width: 1.0)),
          ),
        ),
      ],
    ),
  );
}
