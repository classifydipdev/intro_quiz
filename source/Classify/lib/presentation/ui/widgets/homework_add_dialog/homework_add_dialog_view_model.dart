import 'package:classify/data/entities/schedule.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/widgets/homework_add_dialog/homework_add_dialog_model.dart';
import 'package:classify/presentation/ui/widgets/homework_add_dialog/homework_add_dialog_view.dart';

class HomeworkAddDialogViewModel
    extends AppViewModel<HomeworkAddDialogModel, HomeworkAddDialogView> {
  HomeworkAddDialogViewModel(HomeworkAddDialogView view) : super(view);

  @override
  init() {
    super.init();
    model.onScheduleSelected.setCallbackObject(scheduleSelected);
    model.onScheduleRemoved.setCallback(scheduleRemoved);
    model.onScheduleDateSelected.setCallbackObject(scheduleDateSelected);
    setNearestUniqueScheduleList();
  }

  void setNearestUniqueScheduleList() {
    model.nearestUniqueSchedules =
        model.scheduleManager.getNearestUniqueSubjectSchedules();
    view.updateUI();
  }

  void scheduleSelected(Schedule schedule) {
    model.selectedSchedule = schedule;

    model.currentHomework.scheduleId = schedule.id;
    model.currentHomework.dateTime = getNearestDayDate(schedule.day);

    model.validHomeworkDays = model.scheduleManager.getScheduleDays(schedule);
  }

  void scheduleRemoved() {
    model.selectedSchedule = null;
    model.currentHomework.dateTime = null;
    model.validHomeworkDays = null;
    view.updateUI();
  }

  DateTime getNearestDayDate(int day) {
    DateTime todayDateTime = DateTime.now();
    var currentDay = todayDateTime.weekday - 1;

    var gapBeteenDays = day - currentDay;
    if (gapBeteenDays < 0) gapBeteenDays += 7;

    return todayDateTime.add(Duration(days: gapBeteenDays));
  }

  void scheduleDateSelected(DateTime dateTime){
    model.currentHomework.dateTime = dateTime;
    view.updateUI();
  }
}
