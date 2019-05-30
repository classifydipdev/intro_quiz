import 'package:classify/data/entities/schedule.dart';
import 'package:classify/data/entities/subject.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_model.dart';
import 'package:classify/presentation/utils/views_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/mvvm/utils/base_model_utils.dart';

class ScheduleScreenModel extends AppModel {
  OnCallCommand onSubjectSelect = OnCallCommand();
  OnCallCommand onScheduleSelect = OnCallCommand();
  OnCallCommand onScheduleRemove = OnCallCommand();

  OnCallCommand onLessonsUpdated = OnCallCommand();
  OnCallCommand onSubjectsUpdated = OnCallCommand();

  LoadingStates scheduleLoadingState = LoadingStates.Loading;

  int lessonsPerDay = 7;
  List<Subject> subjects = List();

  List<Schedule> schedules = List();

  Schedule selectedSchedule;

  List<ScrollController> scrollControllersList = List();

  Map<String, GlobalKey> listOfKeys = Map();

  List<Schedule> getSchedulesByDay(int day) {
    List<Schedule> schedulesPreDay = List();
    for (var schedule in schedules) {
      if (schedule.day == day) {
        schedulesPreDay.add(schedule);
      }
    }
    return schedulesPreDay;
  }
}
