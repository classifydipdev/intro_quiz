import 'package:classify/data/entities/lesson.dart';
import 'package:classify/data/entities/subject.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_model.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/mvvm/utils/base_model_utils.dart';
import 'package:classify/data/entities/schedule.dart';

class ScheduleScreenModel extends AppModel {
  OnCallCommand onSubjectSelect = OnCallCommand();
  OnCallCommand onScheduleSelect = OnCallCommand();

  OnCallCommand onLessonsUpdated = OnCallCommand();
  OnCallCommand onSubjectsUpdated = OnCallCommand();

  int lessonsPerDay = 6;
  List<Subject> subjects = List();
  List<Lesson> lessons = List();

  List<Schedule> schedules = List();

  Schedule selectedSchedule;

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
