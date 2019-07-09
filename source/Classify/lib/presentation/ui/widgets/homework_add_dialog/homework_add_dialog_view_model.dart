import 'package:classify/data/entities/homework.dart';
import 'package:classify/data/entities/reminder.dart';
import 'package:classify/data/entities/schedule.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/widgets/homework_add_dialog/homework_add_dialog_model.dart';
import 'package:classify/presentation/ui/widgets/homework_add_dialog/homework_add_dialog_screen.dart';
import 'package:classify/presentation/ui/widgets/homework_add_dialog/homework_add_dialog_view.dart';
import 'package:classify/presentation/utils/views_states.dart';
import 'package:flutter/widgets.dart';

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

    model.onFavouriteSet.setCallback(favouriteSet);
    model.onTestSet.setCallback(testSet);
    model.onReminderSet.setCallbackObject(reminderSet);
    model.onReminderRemoved.setCallback(reminderRemoved);

    model.onValidateAndSaveHomework.setCallback(validateAndSaveHomework);

    setNearestUniqueScheduleList();
  }

  void setNearestUniqueScheduleList() {
    model.nearestUniqueSchedules =
        model.scheduleManager.getNearestUniqueSubjectSchedules();
    view.updateUI();
  }

  void scheduleSelected(Schedule schedule) {
    model.currentHomework.schedule = schedule;

    model.currentHomework.dateTime = getNearestDayDate(schedule.day);

    model.validHomeworkDays = model.scheduleManager.getScheduleDays(schedule);
  }

  void scheduleRemoved() {
    model.currentHomework.schedule = null;
    model.currentHomework.schedule = null;
    model.validHomeworkDays = null;
    view.updateUI();
  }

  void scheduleDateSelected(DateTime dateTime) {
    model.currentHomework.dateTime = dateTime;
    model.nearestUniqueSchedules = model.scheduleManager
        .getNearestUniqueSubjectSchedules(
            day: model.currentHomework.dateTime.weekday - 1);

    if (model.currentHomework.schedule != null) {
      model.currentHomework.schedule = model.scheduleManager.getDaySchedule(
          model.currentHomework.schedule,
          model.currentHomework.dateTime.weekday - 1);
      model.currentHomework.schedule = model.currentHomework.schedule;
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

  void reminderSet(DateTime dateTime) {
    var reminder = model.currentHomework.reminder;
    if (reminder != null) {
      reminder.dateTime = dateTime;
      reminder.fcmToken = model.userManager.user.fcmToken;
    } else {
      reminder = Reminder(
          dateTime, model.userManager.user.id, model.userManager.user.fcmToken);
    }
    model.currentHomework.reminder = reminder;
    view.updateUI();
  }

  void reminderRemoved() {
    model.currentHomework.reminder = null;
    view.updateUI();
  }

  Future validateAndSaveHomework() async {
    model.currentHomework.text = model.textEditController.text;

    String errorString = "";
    if (model.currentHomework == null)
      errorString = "Select a subject, please\n";
    if (model.currentHomework.dateTime == null)
      errorString += "Select a date of homework, please\n";
    if (model.currentHomework.text == null ||
        model.currentHomework.text.length < 1)
      errorString += "Add some description, please\n";

    if (errorString.length > 0) {
      showError(text: errorString);
      return;
    }

    model.loadingState = LoadingStates.Loading;
    view.updateUI();

    model.currentHomework.userId = model.userManager.user.id;
    if (model.currentHomework.reminder != null)
      model.currentHomework.reminder.userId = model.userManager.user.id;

    if (model.dialogType == HomeworkAddDialogType.Add)
      await model.homeworkManager.addNewHomework(model.currentHomework);
    else {
      if (model.currentHomework.reminder.homeworkId == null)
        model.currentHomework.reminder.homeworkId = model.currentHomework.id;
      await model.homeworkManager.editHomework(model.currentHomework);
    }

    Navigator.of(view.context).pop(model.currentHomework);
  }
}
