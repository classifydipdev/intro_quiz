import 'package:classify/data/entities/homework.dart';
import 'package:classify/domain/managers/homework_manager.dart';
import 'package:classify/domain/managers/schedule_manager.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/schedule/schedule_item.dart';
import 'package:classify/presentation/utils/views_states.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/mvvm/utils/base_model_utils.dart';
import 'package:intl/intl.dart';

class HomeScreenModel extends AppModel {
  OnCallCommand onLogOut = OnCallCommand();

  static const String fontFamily = "GoogleSans";
  String dateNow = new DateFormat("MMMM dd, yyyy").format(DateTime.now());
  String dayNow = new DateFormat.EEEE().format(DateTime.now());

  HomeworkManager homeworkManager = HomeworkManager();
  ScheduleManager scheduleManager = ScheduleManager();

  List<ScheduleItem> scheduleItems = List();
  List<Homework> homeworkList = List();

  LoadingStates loadingState = LoadingStates.Loading;
}
