import 'package:classify/data/entities/homework.dart';
import 'package:classify/data/entities/schedule.dart';
import 'package:classify/domain/managers/homework_manager.dart';
import 'package:classify/domain/managers/schedule_manager.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_model.dart';
import 'package:classify/presentation/ui/widgets/homework_add_dialog/homework_add_dialog_screen.dart';
import 'package:classify/presentation/utils/views_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/mvvm/utils/base_model_utils.dart';

class HomeworkAddDialogModel extends AppModel {

  OnCallCommand onScheduleSelected = OnCallCommand();
  OnCallCommand onScheduleRemoved = OnCallCommand();
  OnCallCommand onScheduleDateSelected = OnCallCommand();
  OnCallCommand onScheduleDateRemoved = OnCallCommand();

  OnCallCommand onFavouriteSet = OnCallCommand();
  OnCallCommand onTestSet = OnCallCommand();
  OnCallCommand onReminderSet = OnCallCommand();
  OnCallCommand onReminderRemoved = OnCallCommand();

  OnCallCommand onValidateAndSaveHomework = OnCallCommand();

  final TextEditingController textEditController = TextEditingController();

  List<Schedule> nearestUniqueSchedules;

  Homework currentHomework;

  HomeworkAddDialogType dialogType;

  ScheduleManager scheduleManager = ScheduleManager();
  HomeworkManager homeworkManager = HomeworkManager();

  LoadingStates loadingState = LoadingStates.Compleate;

  List<int> validHomeworkDays;

  HomeworkAddDialogModel({Homework homework}) {
    if (homework == null) {
      currentHomework = Homework();
      dialogType = HomeworkAddDialogType.Add;
    } else {
      currentHomework = homework;
      dialogType = HomeworkAddDialogType.Edit;
    }
  }
}
