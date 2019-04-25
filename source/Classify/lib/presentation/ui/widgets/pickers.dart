import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget getHorizontalPicker(
    PageController controller, int from, int to, int step, Function onChange) {
  return Container(
    width: 280,
    height: 40,
    child: PageView.builder(
      onPageChanged: (position) => onChange(position),
      controller: controller,
      pageSnapping: true,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: 40,
          height: 40,
          child: Container(
            transform: Matrix4.translationValues(0, 0, 0),
            child: Container(
              width: 30,
              child: Text(
                (step * index + from).toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w100,
                  fontFamily: 'GoogleSans',
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
      itemCount: (to - from) ~/ step,
    ),
  );
}

Widget getVerticalPicker() {}

Widget getTimePicker() {}
