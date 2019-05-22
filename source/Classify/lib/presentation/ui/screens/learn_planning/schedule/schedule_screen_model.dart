import 'package:classify/data/entities/lesson.dart';
import 'package:classify/data/entities/subject.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_model.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/mvvm/utils/base_model_utils.dart';
import 'package:classify/data/entities/schedule.dart';

class ScheduleScreenModel extends AppModel {
  OnCallCommand onSubjectSelect = OnCallCommand();
  OnCallCommand onLessonsUpdated = OnCallCommand();
  OnCallCommand onSubjectsUpdated = OnCallCommand();

  int lessonsPerDay = 6;
  List<Subject> subjects = List();
  List<Lesson> lessons = List();

  List<Schedule> schedulesDey1 = List();
  List<Schedule> schedulesDey2 = List();
  List<Schedule> schedulesDey3 = List();
  List<Schedule> schedulesDey4 = List();
  List<Schedule> schedulesDey5 = List();

}
