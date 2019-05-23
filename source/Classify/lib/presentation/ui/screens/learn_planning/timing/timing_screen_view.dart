import 'package:classify/presentation/res/dimens.dart';
import 'package:classify/presentation/res/theme.dart';
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
      body: SafeArea(child: getBody()),
    );
  }

  Widget getBody() {
    return Container(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: DimensApp.paddingMiddle),
          ),
          Text(
            "Lessons per day",
            style: ThemeApp.bigWhiteBoldTextStyle,
          ),
          Padding(
            padding: EdgeInsets.only(top: DimensApp.paddingSmall),
            child: getHorizontalPicker(
                PageController(viewportFraction: 0.2, initialPage: 996),
                (int value) {
              model.lessonsPerDay = value;
            }),
          ),
        ],
      ),
    );
  }
}
