import 'package:classify/presentation/res/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget getHorizontalPicker(
    PageController controller, int from, int to, int step, Function onChange) {
  return Container(
    width: 280,
    height: 40,
    child: Stack(
      children: <Widget>[
        PageView.builder(
          onPageChanged: (position) => onChange(position),
          controller: controller,
          pageSnapping: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              transform: Matrix4.translationValues(0, 0, 0),
              child: Container(
                padding: EdgeInsets.only(top: DimensApp.paddingPico),
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
            );
          },
          itemCount: (to - from) ~/ step + 1,
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 50,
            width: 60,
            decoration: BoxDecoration(
              border: new Border.all(
                  color: Colors.green, width: 1.2, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(80.0),
            ),
          ),
        )
      ],
    ),
  );
}

Widget getVerticalPicker(
    PageController controller, int from, int to, int step, Function onChange) {
  return Container(
    height: 200,
    width: 40,
    child: Stack(
      children: <Widget>[
        PageView.builder(
          scrollDirection: Axis.vertical,
          onPageChanged: (position) => onChange(position),
          controller: controller,
          pageSnapping: true,
          itemBuilder: (BuildContext context, int index) {
            var value = (step * index + from).toString();
            if ((step * index + from) < 10) value = "0" + value;
            return Container(
              transform: Matrix4.translationValues(0, 0, 0),
              child: Container(
                child: Text(
                  value,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w100,
                    fontFamily: 'GoogleSans',
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
          itemCount: (to - from) ~/ step + 1,
        ),
        Padding(
            padding: EdgeInsets.only(bottom: DimensApp.paddingNormal),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 65,
                width: 50,
                decoration: BoxDecoration(
                  border: new Border.all(
                      color: Colors.red, width: 1.2, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(80.0),
                ),
              ),
            ))
      ],
    ),
  );
}

Widget getTimePicker(int startHours, int endHours, Function onTimeChanged) {
  var minutes = 0;
  var hours = startHours;
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      getVerticalPicker(
          PageController(viewportFraction: 0.33), startHours, endHours, 1,
          (position) {
        hours = startHours + position;
        onTimeChanged(hours, minutes);
      }),
      Padding(
        padding: EdgeInsets.all(DimensApp.paddingSmall),
      ),
      getVerticalPicker(PageController(viewportFraction: 0.33), 0, 60, 5,
          (position) {
        minutes = position * 5;
        onTimeChanged(hours, minutes);
      }),
    ],
  );
}
