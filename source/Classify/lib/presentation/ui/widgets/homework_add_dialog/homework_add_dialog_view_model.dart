import 'package:classify/data/entities/homework.dart';
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
    model.onScheduleDateRemoved.setCallback(scheduleDateRemoved);

    model.onFavouriteSet.addCallback(favouriteSet);
    model.onTestSet.addCallback(testSet);

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
    model.currentHomework.scheduleId = null;
    model.validHomeworkDays = null;
    view.updateUI();
  }

  void scheduleDateSelected(DateTime dateTime) {
    model.currentHomework.dateTime = dateTime;
    model.nearestUniqueSchedules = model.scheduleManager
        .getNearestUniqueSubjectSchedules(
            day: model.currentHomework.dateTime.weekday - 1);

    if (model.selectedSchedule != null) {
      model.selectedSchedule = model.scheduleManager.getDaySchedule(
          model.selectedSchedule, model.currentHomework.dateTime.weekday - 1);
      model.currentHomework.scheduleId = model.selectedSchedule.id;
    }
    view.updateUI();
  }

  void scheduleDateRemoved() {
    model.currentHomework.dateTime = null;
    model.nearestUniqueSchedules =
        model.scheduleManager.getNearestUniqueSubjectSchedules();
    view.updateUI();
  }

  DateTime getNearestDayDate(int day) {
    DateTime todayDateTime = DateTime.now();
    var currentDay = todayDateTime.weekday - 1;

    var gapBeteenDays = day - currentDay;
    if (gapBeteenDays < 0) gapBeteenDays += 7;

    return todayDateTime.add(Duration(days: gapBeteenDays));
  }

  void favouriteSet() {
    model.currentHomework.isFavourite = !model.currentHomework.isFavourite;
    view.updateUI();
  }

  void testSet() {
    if (model.currentHomework.type == HomeworkType.Test)
      model.currentHomework.type = HomeworkType.Simple;
    else
      model.currentHomework.type = HomeworkType.Test;

    view.updateUI();
  }
}
