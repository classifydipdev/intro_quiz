import 'package:classify/data/entities/schedule.dart';
import 'package:classify/data/entities/subject.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/schedule/schedule_screen_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/schedule/schedule_screen_view.dart';

class ScheduleScreenViewModel
    extends AppViewModel<ScheduleScreenModel, ScheduleScreenView> {
  ScheduleScreenViewModel(ScheduleScreenView view) : super(view);

  @override
  init() async {
    super.init();
    model.onSubjectSelect.addCallbackObject(onSubjectSelect);
    model.onScheduleSelect.addCallbackObject(onScheduleSelect);

    model.onLessonsUpdated.addCallbackObject(onLessonsUpdated);
    model.onSubjectsUpdated.addCallbackObject(onSubjectsUpdated);

    onLessonsUpdated(model.lessonsPerDay);
  }

  void onSubjectSelect(Subject subject) {
    print(subject.id);
    if (model.selectedSchedule != null) {
      model.selectedSchedule.subject = subject;
      view.updateUI();
    }
  }

  void onScheduleSelect(Schedule schedule) {
    print(schedule.id);
    model.selectedSchedule = schedule;
  }

  void onLessonsUpdated(int lessonsPerDay) async {
    model.lessons = await model.learningManager
        .createLessons(model.userManager.user.id, lessonsPerDay);
    model.schedules = await model.learningManager
        .createShedules(model.userManager.user.id, model.lessons);

    view.updateUI();
  }

  void onSubjectsUpdated(List<Subject> subjects) {
    model.subjects = subjects;
  }
}
