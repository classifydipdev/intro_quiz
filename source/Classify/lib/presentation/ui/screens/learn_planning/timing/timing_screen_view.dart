import 'package:classify/presentation/res/dimens.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/ui/screens/learn_planning/timing/timing_screen_model.dart';
import 'package:classify/presentation/ui/widgets/pickers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimingScreenView extends AppView<TimingScreenModel> {
  TimingScreenView(TimingScreenModel model) : super(model);

  @override
  Widget getView(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0),
              ),
              Text(
                "Lesson duration",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'GoogleSans',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: DimensApp.paddingSmall),
                child: getHorizontalPicker(
                    PageController(viewportFraction: 0.33),
                    10,
                    65,
                    5,
                    (position) {}),
              ),
              Padding(
                padding: EdgeInsets.only(top: DimensApp.paddingNormal),
                child: Text(
                  "School day timings",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'GoogleSans',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: DimensApp.paddingNormal),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Start",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'GoogleSans',
                          fontSize: 22,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Finish",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'GoogleSans',
                          fontSize: 22,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: DimensApp.paddingNormal),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: getTimePicker(7, 18, (int hours, int minutes) {}),
                    ),
                    Expanded(
                      child: getTimePicker(7, 18, (int hours, int minutes) {}),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
