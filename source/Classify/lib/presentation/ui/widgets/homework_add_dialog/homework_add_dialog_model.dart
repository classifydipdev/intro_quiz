import 'package:classify/data/entities/homework.dart';
import 'package:classify/data/entities/schedule.dart';
import 'package:classify/data/entities/subject.dart';
import 'package:classify/domain/managers/schedule_manager.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_model.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/mvvm/utils/base_model_utils.dart';

class HomeworkAddDialogModel extends AppModel {

  HomeworkAddDialogModel();

  OnCallCommand onTap = new OnCallCommand();

  Subject selectedSubject;

  List<Schedule> nearestUniqueSchedules;

  Homework currentHomework = Homework();

  ScheduleManager scheduleManager = ScheduleManager();
}
