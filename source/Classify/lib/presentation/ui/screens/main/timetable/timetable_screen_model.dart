import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/schedule/schedule_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/mvvm/utils/base_model_utils.dart';

class TimetableScreenModel extends AppModel {
  OnCallCommand onTap = OnCallCommand();

  List<List<ScheduleItem>> scheduleDaysItems;

  double scheduleListHeight = 0;
  
  double get screenHeight {
    return MediaQuery.of(view.context).size.height;
  }
}
