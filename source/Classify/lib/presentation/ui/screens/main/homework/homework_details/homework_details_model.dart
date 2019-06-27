import 'package:classify/data/entities/homework.dart';
import 'package:classify/data/entities/schedule.dart';
import 'package:classify/domain/managers/schedule_manager.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_model.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/mvvm/utils/base_model_utils.dart';

class HomeworkDetailsModel extends AppModel {

  Homework homework;
  final Function onNavigateToList;

  OnCallCommand onEditHomework = OnCallCommand();

  HomeworkDetailsModel(this.homework, this.onNavigateToList);

  ScheduleManager scheduleManager = ScheduleManager();
}
