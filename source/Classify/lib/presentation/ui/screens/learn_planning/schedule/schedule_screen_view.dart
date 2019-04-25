import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/ui/screens/learn_planning/schedule/schedule_screen_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScheduleScreenView extends AppView<ScheduleScreenModel> {
  ScheduleScreenView(ScheduleScreenModel model) : super(model);

  @override
  Widget getView(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(),
    );
  }
}
