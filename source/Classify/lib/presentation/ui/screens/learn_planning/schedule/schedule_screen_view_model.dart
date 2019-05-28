import 'package:classify/data/database/firestore/firestore.dart';
import 'package:classify/data/entities/schedule.dart';
import 'package:classify/data/entities/subject.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/schedule/schedule_screen_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/schedule/schedule_screen_view.dart';
import 'package:classify/presentation/utils/views_states.dart';
import 'package:flutter/material.dart';

class ScheduleScreenViewModel
    extends AppViewModel<ScheduleScreenModel, ScheduleScreenView> {
  ScheduleScreenViewModel(ScheduleScreenView view) : super(view);

  @override
  init() async {
    super.init();
    model.onSubjectSelect.setCallbackObject(onSubjectSelect);
    model.onScheduleSelect.setCallbackObject(onScheduleSelect);
    model.onScheduleRemove.setCallbackObject(onScheduleRemove);

    model.onLessonsUpdated.setCallbackObject(onLessonsUpdated);
    model.onSubjectsUpdated.setCallbackObject(onSubjectsUpdated);

    onLessonsUpdated(model.lessonsPerDay);
  }

  void onSubjectSelect(Subject subject) {
    if (model.selectedSchedule != null) {
      model.selectedSchedule.subject = subject;
      Schedule nextSchedule = getNextSchedule();
      if (nextSchedule == null) return;
      model.selectedSchedule = nextSchedule;
      view.updateUI();
    }
  }

  Schedule getNextSchedule() {
    Schedule nextSchedule;
    int currentDay = model.selectedSchedule.day;
    int foundLessonIndex = model.selectedSchedule.lesson.index + 1;
    if (foundLessonIndex + 1 > model.lessonsPerDay) foundLessonIndex = 0;

    for (Schedule schedule in model.getSchedulesByDay(currentDay)) {
      if (schedule.lesson.index == foundLessonIndex) {
        nextSchedule = schedule;
      }
    }
    changeScheduleListPosition(model.selectedSchedule);
    return nextSchedule;
  }

  void changeScheduleListPosition(Schedule schedule) async {
    var currentDay = schedule.day;
    var scheduleId = schedule.id;
    var key = model.listOfKeys[scheduleId];
    if (key == null) return;
    var scheduleContext = key.currentContext;
    if (scheduleContext != null) {
      model.scrollControllersList[currentDay]
          .jumpTo(getPositions(scheduleContext));
    }
  }

  double getPositions(BuildContext currentContext) {
    RenderBox renderBoxRed = currentContext.findRenderObject();
    var positionRed = renderBoxRed.localToGlobal(Offset.zero);
    view.updateUI();
    return positionRed.dx;
  }

  void onScheduleSelect(Schedule schedule) {
    model.selectedSchedule = schedule;
  }

  void onScheduleRemove(Schedule schedule) {
    model.selectedSchedule = schedule;
    model.selectedSchedule.subject = null;
    view.updateUI();
  }

  void onLessonsUpdated(int lessonsPerDay) async {
    model.schedules = await AppFirbaseFirestore()
        .createLessonsAndSchedules(model.userManager.user.id, lessonsPerDay);
    model.scheduleLoadingState = LoadingStates.Compleate;
    view.updateUI();
  }

  void onSubjectsUpdated(List<Subject> subjects) {
    model.subjects = subjects;
  }
}
