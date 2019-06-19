import 'package:classify/data/database/firestore/firestore.dart';
import 'package:classify/data/entities/homework.dart';
import 'package:classify/data/entities/reminder.dart';
import 'package:classify/data/entities/schedule.dart';
import 'package:classify/domain/managers/schedule_manager.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_model.dart';
import 'package:classify/presentation/utils/views_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/mvvm/utils/base_model_utils.dart';

class HomeworkAddDialogModel extends AppModel {
  HomeworkAddDialogModel();

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

  Schedule selectedSchedule;

  List<Schedule> nearestUniqueSchedules;

  Homework currentHomework = Homework();
  Reminder currentReminder;

  ScheduleManager scheduleManager = ScheduleManager();
  AppFirbaseFirestore firestore = AppFirbaseFirestore();

  LoadingStates loadingState = LoadingStates.Compleate;

  List<int> validHomeworkDays;
}
